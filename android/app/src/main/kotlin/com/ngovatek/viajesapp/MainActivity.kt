package com.ngovatek.viajesapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.ContentValues
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import java.io.File
import java.io.FileInputStream
import java.io.OutputStream

class MainActivity : FlutterActivity() {
    private val channelName = "juntoz/device_ai"
    private val ioChannelName = "juntoz/device_io"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "isAvailable" -> {
                    // TODO: Integrate Android Device AI / AICore check here and return true when supported
                    result.success(false)
                }
                "askTripAssistant" -> {
                    // TODO: Implement on-device generation with Gemini Nano / AICore.
                    result.error("UNAVAILABLE", "Device AI not integrated", null)
                }
                else -> result.notImplemented()
            }
        }

        // Channel for device IO helpers (e.g., saving to Downloads without UI)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ioChannelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveToDownloads" -> {
                    try {
                        @Suppress("UNCHECKED_CAST")
                        val args = call.arguments as? Map<String, Any?>
                        val fileName = args?.get("fileName") as? String
                        val mimeType = (args?.get("mimeType") as? String) ?: "application/octet-stream"
                        val data = args?.get("data") as? ByteArray
                        val sourcePath = args?.get("sourcePath") as? String

                        if (fileName == null || (data == null && (sourcePath == null || sourcePath.isEmpty()))) {
                            result.error("ARGUMENT_ERROR", "Missing fileName and data/sourcePath", null)
                            return@setMethodCallHandler
                        }

                        val uriString = saveIntoDownloads(fileName, mimeType, data, sourcePath)
                        result.success(uriString)
                    } catch (e: Exception) {
                        result.error("SAVE_FAILED", e.message, null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun saveIntoDownloads(fileName: String, mimeType: String, data: ByteArray?, sourcePath: String?): String? {
        val resolver = applicationContext.contentResolver
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val values = ContentValues().apply {
                put(MediaStore.Downloads.DISPLAY_NAME, fileName)
                put(MediaStore.Downloads.MIME_TYPE, mimeType)
                put(MediaStore.Downloads.IS_PENDING, 1)
                put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
            }
            val collection = MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
            val uri = resolver.insert(collection, values) ?: throw Exception("Failed to create download entry")
            try {
                resolver.openOutputStream(uri)?.use { out ->
                    writeToStream(out, data, sourcePath)
                } ?: throw Exception("Cannot open output stream")
            } catch (e: Exception) {
                // Cleanup entry on failure
                resolver.delete(uri, null, null)
                throw e
            } finally {
                val completed = ContentValues().apply { put(MediaStore.Downloads.IS_PENDING, 0) }
                resolver.update(uri, completed, null, null)
            }
            return uri.toString()
        } else {
            // Legacy approach for API < 29 (requires WRITE_EXTERNAL_STORAGE)
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloadsDir.exists()) downloadsDir.mkdirs()
            val outFile = File(downloadsDir, fileName)
            outFile.outputStream().use { out ->
                writeToStream(out, data, sourcePath)
            }
            // Return a file:// URI string for consistency
            return outFile.toURI().toString()
        }
    }

    private fun writeToStream(out: OutputStream, data: ByteArray?, sourcePath: String?) {
        if (data != null) {
            out.write(data)
        } else if (!sourcePath.isNullOrEmpty()) {
            val inFile = File(sourcePath)
            FileInputStream(inFile).use { input ->
                input.copyTo(out)
            }
        } else {
            throw IllegalArgumentException("No data or sourcePath provided")
        }
    }
}
