import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static const supported = ['es', 'en', 'pt', 'zh'];

  static const Map<String, Map<String, String>> _strings = {
    'en': {
      'appTitle': 'Juntoz',
      'myTrips': 'My Trips',
      'organizeYourAdventures': 'Organize your adventures',
      'searchHint': 'Search by title or destination',
      'sortUpcoming': 'Upcoming',
      'sortRecent': 'Recent',
      'noTripsYet': 'You have no trips yet',
      'noResults': 'No results',
      'createFirstTrip': 'Create your first trip and start planning',
      'tryAnotherSearch': 'Try another search',
      'newTrip': 'New Trip',
      'open': 'Open',
      'delete': 'Delete',
      'deleteTrip': 'Delete trip',
      'deleteTripConfirm': 'Are you sure you want to delete "{title}"?',
      'cancel': 'Cancel',
      'deletedTrip': 'Trip deleted',
      'itineraryEmpty': 'No events in itinerary',
      'itineraryAdd': 'Add flights, hotels and activities',
      'addEvent': 'Add to itinerary',
      'filterType': 'Type',
      'all': 'All',
      'upcomingOnly': 'Upcoming only',
      'sortBy': 'Sort by',
      'byDateTime': 'By date & time',
      'viewOnMap': 'View on Google Maps',
      'selectOnMap': 'Select on Maps',
      'documentsEmpty': 'No documents',
      'scanOrUpload': 'Scan or upload travel documents',
      'scan': 'Scan',
      'upload': 'Upload',
      'scannedDocPrefix': 'Scanned document - ',
      'docPrefix': 'Document - ',
      'scanSuccess': 'Document scanned successfully. Processing with AI...',
      'scanError': 'Scan error: {error}',
      'uploadSuccess': 'Document uploaded successfully',
      'uploadError': 'Upload error: {error}',
      'noLists': 'No lists',
      'createPackingLists': 'Create packing and documentation lists',
      'newList': 'New List',
      'listEmpty': 'Empty list',
      'addItemsToList': 'Add items to this list',
      'person': 'Person',
      'category': 'Category',
      'inviteMember': 'Invite Member',
      'inviteFeatureWip': 'Invitation: send link or email',
      'tripNotFound': 'Trip not found',
      'tripTitleLabel': 'Trip title',
      'required': 'Required',
      'destination': 'Destination',
      'description': 'Description',
      'startDate': 'Start date',
      'endDate': 'End date',
      'createTrip': 'Create Trip',
      'tripCreated': 'Trip created successfully',
      'flight': 'Flight',
      'train': 'Train',
      'hotel': 'Hotel',
      'activity': 'Activity',
      'freeNote': 'Free Note',
      'editFlight': 'Edit Flight',
      'flightNumber': 'Flight number',
      'selectDate': 'Select date',
      'origin': 'Origin',
      'boardingTime': 'Boarding time',
      'notes': 'Notes',
      'save': 'Save',
      'editTrain': 'Edit Train',
      'trainNumber': 'Train number',
      'departureTime': 'Departure time',
      'editHotel': 'Edit Hotel',
      'hotelName': 'Hotel name',
      'address': 'Address',
      'checkin': 'Check-in',
      'checkout': 'Check-out',
      'confirmationNumber': 'Confirmation number',
      'editActivity': 'Edit Activity',
      'title': 'Title',
      'place': 'Place',
      'dateTime': 'Date and time',
      'duration': 'Duration',
      'editNote': 'Edit Note',
      'content': 'Content',
      'sectionFlight': 'FLIGHT',
      'sectionTrain': 'TRAIN',
      'sectionHotel': 'HOTEL',
      'sectionActivity': 'ACTIVITY',
      'sectionNote': 'NOTE',
      'flightNumberLabel': 'Flight number',
      'boarding': 'Boarding',
      'number': 'Number',
      'departure': 'Departure',
      'confirmation': 'Confirmation',
      'howToGet': 'Directions',
      'completedShort': '{completed} / {total} completed',
      'addToCalendar': 'Add to calendar',
      'exportItinerary': 'Export itinerary (.ics)',
      // Move/Copy
      'copyToAnotherTrip': 'Copy to another trip',
      'moveToAnotherTrip': 'Move to another trip',
      'selectTrip': 'Select destination trip',
      'copiedToTrip': 'Copied to trip',
      'movedToTrip': 'Moved to trip',
      'noOtherTrips': 'No other trips available',
      'tabAI': 'AI',
      'tabSandbox': 'Sandbox',
      'askAboutTrip': 'Ask anything about your trip…',
      'generate': 'Generate',
      'aiPromptHint': 'Ask for plans, tips, or nearby places. E.g. “what to do on day 2 near Shibuya?”',
      'aiUnavailable': 'AI is not available on this device.',
      'addToSandbox': 'Add to Sandbox',
      'moveToItinerary': 'Move to itinerary',
      'addDraft': 'Add draft',
      'sandboxEmpty': 'The sandbox is empty. Create draft ideas to organize later.',
      'moreInfo': 'More info',
      'askAI': 'Ask AI',
      'aiError': 'AI error: {error}',
      'edit': 'Edit',
      'assign': 'Assign',
      'manage': 'Manage',
      'openNow': 'Open now',
      'listsLabel': 'Lists',
      'eventNotFound': 'Event not found',
      'changeDateTo': 'Change date to {date}?',
      'yes': 'Yes',
      // Auth
      'welcome': 'Welcome 👋',
      'signInSubtitle': 'Sign in to continue',
      'email': 'Email',
      'password': 'Password',
      'minChars': 'At least {n} characters',
      'signIn': 'Sign in',
      'signingIn': 'Signing in…',
      'or': 'or',
      'continueWithGoogle': 'Continue with Google',
      'connecting': 'Connecting…',
      'noAccountSignUp': "Don't have an account? Sign up",
      'signInErrorGeneric': 'Could not sign in.',
      'invalidCredentials': 'Invalid credentials. Check your email and password.',
      'tooManyRequests': 'Too many attempts. Try again later.',
      'networkError': 'Network error. Check your connection.',
      'unexpectedError': 'An unexpected error occurred. Try again.',
      'googleSignInFailed': 'Could not sign in with Google.',
      'signInCancelled': 'Sign in cancelled.',
      'createAccountTitle': 'Create account ✨',
      'signUpSubtitle': 'Register to start organizing your trips',
      'name': 'Name',
      'createAccount': 'Create account',
      'creating': 'Creating…',
      'alreadyHaveAccountSignIn': 'Already have an account? Sign in',
      'signUpErrorGeneric': 'Could not create the account.',
      'emailInUse': 'That email is already registered. Try signing in.',
      'invalidEmail': 'Invalid email. Check the format.',
      'weakPassword': 'Weak password. Use at least 6 characters.',
      'operationNotAllowed': 'Email sign up disabled in Firebase.',
      // Language select
      'chooseLanguageTitle': 'Choose your language',
      // Demo access
      'tryDemo': 'Try demo',
      'loadingDemo': 'Loading demo…',
      // Places
      'places': 'Places',
      'addPlace': 'Add place',
      'placesEmpty': 'No places yet',
      'addInterestingPlaces': 'Add cafés, bars, restaurants or points of interest',
      'searchPlacesHint': 'Search places…',
      'deletePlaceConfirm': 'Delete "{name}"?',
      'categoryCafe': 'Cafe',
      'categoryBar': 'Bar',
      'categoryRestaurant': 'Restaurant',
      'categoryAttraction': 'Attraction',
      'categoryShop': 'Shop',
      'categoryOther': 'Other',
    },
    'es': {
      'appTitle': 'Juntoz',
      'myTrips': 'Mis Viajes',
      'organizeYourAdventures': 'Organiza tus aventuras',
      'searchHint': 'Buscar por título o destino',
      'sortUpcoming': 'Próximos',
      'sortRecent': 'Recientes',
      'noTripsYet': 'No tienes viajes aún',
      'noResults': 'Sin resultados',
      'createFirstTrip': 'Crea tu primer viaje y comienza a planificar',
      'tryAnotherSearch': 'Prueba con otra búsqueda',
      'newTrip': 'Nuevo Viaje',
      'open': 'Abrir',
      'delete': 'Eliminar',
      'deleteTrip': 'Eliminar viaje',
      'deleteTripConfirm': '¿Seguro que quieres eliminar "{title}"?',
      'cancel': 'Cancelar',
      'deletedTrip': 'Viaje eliminado',
      'itineraryEmpty': 'No hay eventos en el itinerario',
      'itineraryAdd': 'Agrega vuelos, hoteles y actividades',
      'addEvent': 'Agregar al itinerario',
      'filterType': 'Tipo',
      'all': 'Todos',
      'upcomingOnly': 'Solo próximos',
      'sortBy': 'Ordenar por',
      'byDateTime': 'Por fecha y hora',
      'viewOnMap': 'Ver en Google Maps',
      'selectOnMap': 'Seleccionar en Maps',
      'documentsEmpty': 'No hay documentos',
      'scanOrUpload': 'Escanea o sube documentos del viaje',
      'scan': 'Escanear',
      'upload': 'Subir',
      'scannedDocPrefix': 'Documento escaneado - ',
      'docPrefix': 'Documento - ',
      'scanSuccess': 'Documento escaneado correctamente. Procesando con IA...',
      'scanError': 'Error al escanear: {error}',
      'uploadSuccess': 'Documento subido correctamente',
      'uploadError': 'Error al subir: {error}',
      'noLists': 'No hay listas',
      'createPackingLists': 'Crea listas de empaque y documentación',
      'newList': 'Nueva Lista',
      'listEmpty': 'Lista vacía',
      'addItemsToList': 'Agrega items a esta lista',
      'person': 'Persona',
      'category': 'Categoría',
      'inviteMember': 'Invitar Miembro',
      'inviteFeatureWip': 'Funcionalidad de invitación: Enviar link o correo de invitación',
      'tripNotFound': 'Viaje no encontrado',
      'tripTitleLabel': 'Título del viaje',
      'required': 'Requerido',
      'destination': 'Destino',
      'description': 'Descripción',
      'startDate': 'Fecha inicio',
      'endDate': 'Fecha fin',
      'createTrip': 'Crear Viaje',
      'tripCreated': 'Viaje creado exitosamente',
      'flight': 'Vuelo',
      'train': 'Tren',
      'hotel': 'Hotel',
      'activity': 'Actividad',
      'freeNote': 'Nota Libre',
      'editFlight': 'Editar Vuelo',
      'flightNumber': 'Número de vuelo',
      'selectDate': 'Seleccionar fecha',
      'origin': 'Origen',
      'boardingTime': 'Hora de embarque',
      'notes': 'Observaciones',
      'save': 'Guardar',
      'editTrain': 'Editar Tren',
      'trainNumber': 'Número de tren',
      'departureTime': 'Hora de salida',
      'editHotel': 'Editar Hotel',
      'hotelName': 'Nombre del hotel',
      'address': 'Dirección',
      'checkin': 'Check-in',
      'checkout': 'Check-out',
      'confirmationNumber': 'Número de confirmación',
      'editActivity': 'Editar Actividad',
      'title': 'Título',
      'place': 'Lugar',
      'dateTime': 'Fecha y hora',
      'duration': 'Duración',
      'editNote': 'Editar Nota',
      'content': 'Contenido',
      'sectionFlight': 'VUELO',
      'sectionTrain': 'TREN',
      'sectionHotel': 'HOTEL',
      'sectionActivity': 'ACTIVIDAD',
      'sectionNote': 'NOTA',
      'flightNumberLabel': 'Número de vuelo',
      'boarding': 'Embarque',
      'number': 'Número',
      'departure': 'Salida',
      'confirmation': 'Confirmación',
      'howToGet': 'Cómo llegar',
      'completedShort': '{completed} / {total} completados',
      'addToCalendar': 'Agregar al calendario',
      'exportItinerary': 'Exportar itinerario (.ics)',
      // Move/Copy
      'copyToAnotherTrip': 'Copiar a otro viaje',
      'moveToAnotherTrip': 'Mover a otro viaje',
      'selectTrip': 'Selecciona destino',
      'copiedToTrip': 'Copiado al viaje',
      'movedToTrip': 'Movido al viaje',
      'noOtherTrips': 'No hay otros viajes disponibles',
      'tabAI': 'IA',
      'tabSandbox': 'Sandbox',
      'askAboutTrip': 'Preguntá sobre tu viaje…',
      'generate': 'Generar',
      'aiPromptHint': 'Pedí planes, tips o lugares cercanos. Ej: “¿qué hacer el día 2 cerca de Shibuya?”',
      'aiUnavailable': 'La IA no está disponible en este dispositivo.',
      'addToSandbox': 'Agregar al Sandbox',
      'moveToItinerary': 'Pasar al itinerario',
      'addDraft': 'Agregar borrador',
      'sandboxEmpty': 'El sandbox está vacío. Crea borradores para organizar luego.',
      'moreInfo': 'Más información',
      'askAI': 'Preguntar a IA',
      'aiError': 'Error de IA: {error}',
      'edit': 'Editar',
      'assign': 'Asignar',
      'manage': 'Administrar',
      'openNow': 'Abierto ahora',
      'listsLabel': 'Listas',
      'eventNotFound': 'Evento no encontrado',
      'changeDateTo': '¿Cambiar la fecha a {date}?',
      'yes': 'Sí',
      // Auth
      'welcome': 'Bienvenido 👋',
      'signInSubtitle': 'Inicia sesión para continuar',
      'email': 'Email',
      'password': 'Contraseña',
      'minChars': 'Mínimo {n} caracteres',
      'signIn': 'Iniciar sesión',
      'signingIn': 'Entrando…',
      'or': 'o',
      'continueWithGoogle': 'Continuar con Google',
      'connecting': 'Conectando…',
      'noAccountSignUp': '¿No tienes cuenta? Regístrate',
      'signInErrorGeneric': 'No se pudo iniciar sesión.',
      'invalidCredentials': 'Credenciales inválidas. Revisa tu email y contraseña.',
      'tooManyRequests': 'Demasiados intentos. Intenta más tarde.',
      'networkError': 'Error de red. Verifica tu conexión.',
      'unexpectedError': 'Ocurrió un error inesperado. Intenta de nuevo.',
      'googleSignInFailed': 'No se pudo iniciar sesión con Google.',
      'signInCancelled': 'Inicio de sesión cancelado.',
      'createAccountTitle': 'Crear cuenta ✨',
      'signUpSubtitle': 'Regístrate para empezar a organizar tus viajes',
      'name': 'Nombre',
      'createAccount': 'Crear cuenta',
      'creating': 'Creando…',
      'alreadyHaveAccountSignIn': '¿Ya tienes cuenta? Inicia sesión',
      'signUpErrorGeneric': 'No se pudo crear la cuenta.',
      'emailInUse': 'Ese email ya está registrado. Prueba iniciar sesión.',
      'invalidEmail': 'Email inválido. Verifica el formato.',
      'weakPassword': 'Contraseña débil. Usa al menos 6 caracteres.',
      'operationNotAllowed': 'Registro por email deshabilitado en Firebase.',
      // Language select
      'chooseLanguageTitle': 'Elige tu idioma',
      // Demo access
      'tryDemo': 'Probar demo',
      'loadingDemo': 'Cargando demo…',
      // Places
      'places': 'Lugares',
      'addPlace': 'Agregar lugar',
      'placesEmpty': 'Sin lugares aún',
      'addInterestingPlaces': 'Agrega cafés, bares, restaurantes o puntos de interés',
      'searchPlacesHint': 'Buscar lugares…',
      'deletePlaceConfirm': '¿Eliminar "{name}"?',
      'categoryCafe': 'Café',
      'categoryBar': 'Bar',
      'categoryRestaurant': 'Restaurante',
      'categoryAttraction': 'Atracción',
      'categoryShop': 'Tienda',
      'categoryOther': 'Otro',
    },
    'pt': {
      'appTitle': 'Juntoz',
      'myTrips': 'Minhas Viagens',
      'organizeYourAdventures': 'Organize suas aventuras',
      'searchHint': 'Pesquisar por título ou destino',
      'sortUpcoming': 'Próximas',
      'sortRecent': 'Recentes',
      'noTripsYet': 'Você ainda não tem viagens',
      'noResults': 'Sem resultados',
      'createFirstTrip': 'Crie sua primeira viagem e comece a planejar',
      'tryAnotherSearch': 'Tente outra busca',
      'newTrip': 'Nova Viagem',
      'open': 'Abrir',
      'delete': 'Excluir',
      'deleteTrip': 'Excluir viagem',
      'deleteTripConfirm': 'Tem certeza de que deseja excluir "{title}"?',
      'cancel': 'Cancelar',
      'deletedTrip': 'Viagem excluída',
      'itineraryEmpty': 'Não há eventos no itinerário',
      'itineraryAdd': 'Adicione voos, hotéis e atividades',
      'addEvent': 'Adicionar ao itinerário',
      'filterType': 'Tipo',
      'all': 'Todos',
      'upcomingOnly': 'Apenas próximas',
      'sortBy': 'Ordenar por',
      'byDateTime': 'Por data e hora',
      'viewOnMap': 'Ver no Google Maps',
      'selectOnMap': 'Selecionar no Maps',
      'documentsEmpty': 'Não há documentos',
      'scanOrUpload': 'Digitalize ou envie documentos da viagem',
      'scan': 'Digitalizar',
      'upload': 'Enviar',
      'scannedDocPrefix': 'Documento digitalizado - ',
      'docPrefix': 'Documento - ',
      'scanSuccess': 'Documento digitalizado com sucesso. Processando com IA...',
      'scanError': 'Erro ao digitalizar: {error}',
      'uploadSuccess': 'Documento enviado com sucesso',
      'uploadError': 'Erro ao enviar: {error}',
      'noLists': 'Não há listas',
      'createPackingLists': 'Crie listas de bagagem e documentação',
      'newList': 'Nova Lista',
      'listEmpty': 'Lista vazia',
      'addItemsToList': 'Adicione itens a esta lista',
      'person': 'Pessoa',
      'category': 'Categoria',
      'inviteMember': 'Convidar Membro',
      'inviteFeatureWip': 'Convite: enviar link ou e-mail',
      'tripNotFound': 'Viagem não encontrada',
      'tripTitleLabel': 'Título da viagem',
      'required': 'Obrigatório',
      'destination': 'Destino',
      'description': 'Descrição',
      'startDate': 'Data de início',
      'endDate': 'Data de término',
      'createTrip': 'Criar Viagem',
      'tripCreated': 'Viagem criada com sucesso',
      'flight': 'Voo',
      'train': 'Trem',
      'hotel': 'Hotel',
      'activity': 'Atividade',
      'freeNote': 'Nota Livre',
      'editFlight': 'Editar Voo',
      'flightNumber': 'Número do voo',
      'selectDate': 'Selecionar data',
      'origin': 'Origem',
      'boardingTime': 'Hora de embarque',
      'notes': 'Observações',
      'save': 'Salvar',
      'editTrain': 'Editar Trem',
      'trainNumber': 'Número do trem',
      'departureTime': 'Hora de partida',
      'editHotel': 'Editar Hotel',
      'hotelName': 'Nome do hotel',
      'address': 'Endereço',
      'checkin': 'Check-in',
      'checkout': 'Check-out',
      'confirmationNumber': 'Número de confirmação',
      'editActivity': 'Editar Atividade',
      'title': 'Título',
      'place': 'Local',
      'dateTime': 'Data e hora',
      'duration': 'Duração',
      'editNote': 'Editar Nota',
      'content': 'Conteúdo',
      'sectionFlight': 'VOO',
      'sectionTrain': 'TREM',
      'sectionHotel': 'HOTEL',
      'sectionActivity': 'ATIVIDADE',
      'sectionNote': 'NOTA',
      'flightNumberLabel': 'Número do voo',
      'boarding': 'Embarque',
      'number': 'Número',
      'departure': 'Partida',
      'confirmation': 'Confirmação',
      'howToGet': 'Como chegar',
      'completedShort': '{completed} / {total} concluídos',
      'addToCalendar': 'Adicionar ao calendário',
      'exportItinerary': 'Exportar itinerário (.ics)',
      // Move/Copy
      'copyToAnotherTrip': 'Copiar para outra viagem',
      'moveToAnotherTrip': 'Mover para outra viagem',
      'selectTrip': 'Selecione o destino',
      'copiedToTrip': 'Copiado para a viagem',
      'movedToTrip': 'Movido para a viagem',
      'noOtherTrips': 'Não há outras viagens disponíveis',
      'tabAI': 'IA',
      'tabSandbox': 'Sandbox',
      'askAboutTrip': 'Pergunte sobre sua viagem…',
      'generate': 'Gerar',
      'aiPromptHint': 'Peça planos, dicas ou lugares próximos. Ex: “o que fazer no dia 2 perto de Shibuya?”',
      'aiUnavailable': 'IA não está disponível neste dispositivo.',
      'addToSandbox': 'Adicionar ao Sandbox',
      'moveToItinerary': 'Mover para itinerário',
      'addDraft': 'Adicionar rascunho',
      'sandboxEmpty': 'O sandbox está vazio. Crie rascunhos para organizar depois.',
      'moreInfo': 'Mais informações',
      'askAI': 'Perguntar à IA',
      'aiError': 'Erro de IA: {error}',
      'edit': 'Editar',
      'assign': 'Atribuir',
      'manage': 'Gerenciar',
      'openNow': 'Aberto agora',
      'listsLabel': 'Listas',
      'eventNotFound': 'Evento não encontrado',
      'changeDateTo': 'Alterar a data para {date}?',
      'yes': 'Sim',
      // Auth
      'welcome': 'Bem-vindo 👋',
      'signInSubtitle': 'Faça login para continuar',
      'email': 'E-mail',
      'password': 'Senha',
      'minChars': 'Mínimo de {n} caracteres',
      'signIn': 'Entrar',
      'signingIn': 'Entrando…',
      'or': 'ou',
      'continueWithGoogle': 'Continuar com o Google',
      'connecting': 'Conectando…',
      'noAccountSignUp': 'Não tem conta? Cadastre-se',
      'signInErrorGeneric': 'Não foi possível entrar.',
      'invalidCredentials': 'Credenciais inválidas. Verifique e-mail e senha.',
      'tooManyRequests': 'Muitas tentativas. Tente novamente mais tarde.',
      'networkError': 'Erro de rede. Verifique sua conexão.',
      'unexpectedError': 'Ocorreu um erro inesperado. Tente novamente.',
      'googleSignInFailed': 'Não foi possível entrar com o Google.',
      'signInCancelled': 'Login cancelado.',
      'createAccountTitle': 'Criar conta ✨',
      'signUpSubtitle': 'Cadastre-se para organizar suas viagens',
      'name': 'Nome',
      'createAccount': 'Criar conta',
      'creating': 'Criando…',
      'alreadyHaveAccountSignIn': 'Já tem conta? Entrar',
      'signUpErrorGeneric': 'Não foi possível criar a conta.',
      'emailInUse': 'Esse e-mail já está registrado. Tente fazer login.',
      'invalidEmail': 'E-mail inválido. Verifique o formato.',
      'weakPassword': 'Senha fraca. Use pelo menos 6 caracteres.',
      'operationNotAllowed': 'Cadastro por e-mail desabilitado no Firebase.',
      // Language select
      'chooseLanguageTitle': 'Escolha seu idioma',
      // Demo access
      'tryDemo': 'Testar demo',
      'loadingDemo': 'Carregando demo…',
      // Places
      'places': 'Lugares',
      'addPlace': 'Adicionar lugar',
      'placesEmpty': 'Sem lugares ainda',
      'addInterestingPlaces': 'Adicione cafés, bares, restaurantes ou pontos de interesse',
      'searchPlacesHint': 'Pesquisar lugares…',
      'deletePlaceConfirm': 'Excluir "{name}"?',
      'categoryCafe': 'Cafeteria',
      'categoryBar': 'Bar',
      'categoryRestaurant': 'Restaurante',
      'categoryAttraction': 'Atração',
      'categoryShop': 'Loja',
      'categoryOther': 'Outro',
    },
    'zh': {
      'appTitle': 'Juntoz',
      'myTrips': '我的行程',
      'organizeYourAdventures': '组织你的旅途',
      'searchHint': '按标题或目的地搜索',
      'sortUpcoming': '即将出发',
      'sortRecent': '最近',
      'noTripsYet': '你还没有行程',
      'noResults': '没有结果',
      'createFirstTrip': '创建你的第一个行程并开始规划',
      'tryAnotherSearch': '试试其他搜索',
      'newTrip': '新建行程',
      'open': '打开',
      'delete': '删除',
      'deleteTrip': '删除行程',
      'deleteTripConfirm': '确定要删除“{title}”吗？',
      'cancel': '取消',
      'deletedTrip': '行程已删除',
      'itineraryEmpty': '行程中没有事件',
      'itineraryAdd': '添加航班、酒店和活动',
      'addEvent': '添加到行程',
      'filterType': '类型',
      'all': '全部',
      'upcomingOnly': '仅即将发生',
      'sortBy': '排序方式',
      'byDateTime': '按日期和时间',
      'viewOnMap': '在 Google 地图查看',
      'selectOnMap': '在地图中选择',
      'documentsEmpty': '没有文档',
      'scanOrUpload': '扫描或上传行程文档',
      'scan': '扫描',
      'upload': '上传',
      'scannedDocPrefix': '已扫描文档 - ',
      'docPrefix': '文档 - ',
      'scanSuccess': '文档扫描成功。正在使用 AI 处理…',
      'scanError': '扫描错误：{error}',
      'uploadSuccess': '文档上传成功',
      'uploadError': '上传错误：{error}',
      'noLists': '没有清单',
      'createPackingLists': '创建行李和资料清单',
      'newList': '新建清单',
      'listEmpty': '清单为空',
      'addItemsToList': '向此清单添加项目',
      'person': '人员',
      'category': '类别',
      'inviteMember': '邀请成员',
      'inviteFeatureWip': '邀请：发送链接或电子邮件',
      'tripNotFound': '未找到行程',
      'tripTitleLabel': '行程标题',
      'required': '必填',
      'destination': '目的地',
      'description': '描述',
      'startDate': '开始日期',
      'endDate': '结束日期',
      'createTrip': '创建行程',
      'tripCreated': '行程创建成功',
      'flight': '航班',
      'train': '火车',
      'hotel': '酒店',
      'activity': '活动',
      'freeNote': '自由笔记',
      'editFlight': '编辑航班',
      'flightNumber': '航班号',
      'selectDate': '选择日期',
      'origin': '出发地',
      'boardingTime': '登机时间',
      'notes': '备注',
      'save': '保存',
      'editTrain': '编辑火车',
      'trainNumber': '车次',
      'departureTime': '出发时间',
      'editHotel': '编辑酒店',
      'hotelName': '酒店名称',
      'address': '地址',
      'checkin': '入住',
      'checkout': '退房',
      'confirmationNumber': '确认号码',
      'editActivity': '编辑活动',
      'title': '标题',
      'place': '地点',
      'dateTime': '日期和时间',
      'duration': '时长',
      'editNote': '编辑笔记',
      'content': '内容',
      'sectionFlight': '航班',
      'sectionTrain': '火车',
      'sectionHotel': '酒店',
      'sectionActivity': '活动',
      'sectionNote': '笔记',
      'flightNumberLabel': '航班号',
      'boarding': '登机',
      'number': '编号',
      'departure': '出发',
      'confirmation': '确认',
      'howToGet': '路线',
      'completedShort': '{completed} / {total} 已完成',
      'addToCalendar': '添加到日历',
      'exportItinerary': '导出行程 (.ics)',
      'tabAI': 'AI',
      'tabSandbox': '草稿箱',
      'askAboutTrip': '询问有关你的行程…',
      'generate': '生成',
      'aiPromptHint': '询问计划、建议或附近地点。例如：“第2天在涩谷附近做什么？”',
      'aiUnavailable': '此设备不可用 AI。',
      'addToSandbox': '添加到草稿箱',
      'moveToItinerary': '移到行程',
      'addDraft': '添加草稿',
      'sandboxEmpty': '草稿箱为空。先创建草稿以便稍后整理。',
      'moreInfo': '更多信息',
      'askAI': '询问 AI',
      'aiError': 'AI 错误：{error}',
      'edit': '编辑',
      'assign': '分配',
      'manage': '管理',
      'openNow': '正在营业',
      'listsLabel': '清单',
      'eventNotFound': '未找到事件',
      'changeDateTo': '将日期更改为 {date}？',
      'yes': '是',
    },
  };

  String _t(String key) => _strings[locale.languageCode]?[key] ?? _strings['en']![key] ?? key;

  // Simple getters
  String get appTitle => _t('appTitle');
  String get myTrips => _t('myTrips');
  String get organizeYourAdventures => _t('organizeYourAdventures');
  String get searchHint => _t('searchHint');
  String get sortUpcoming => _t('sortUpcoming');
  String get sortRecent => _t('sortRecent');
  String get noTripsYet => _t('noTripsYet');
  String get noResults => _t('noResults');
  String get createFirstTrip => _t('createFirstTrip');
  String get tryAnotherSearch => _t('tryAnotherSearch');
  String get newTrip => _t('newTrip');
  String get open => _t('open');
  String get delete => _t('delete');
  String get deleteTrip => _t('deleteTrip');
  String deleteTripConfirm(String title) => _t('deleteTripConfirm').replaceAll('{title}', title);
  String get cancel => _t('cancel');
  String get deletedTrip => _t('deletedTrip');
  String get itineraryEmpty => _t('itineraryEmpty');
  String get itineraryAdd => _t('itineraryAdd');
  String get addEvent => _t('addEvent');
  String get filterType => _t('filterType');
  String get all => _t('all');
  String get upcomingOnly => _t('upcomingOnly');
  String get sortBy => _t('sortBy');
  String get byDateTime => _t('byDateTime');
  String get viewOnMap => _t('viewOnMap');
  String get selectOnMap => _t('selectOnMap');
  String get documentsEmpty => _t('documentsEmpty');
  String get scanOrUpload => _t('scanOrUpload');
  String get scan => _t('scan');
  String get upload => _t('upload');
  String get scannedDocPrefix => _t('scannedDocPrefix');
  String get docPrefix => _t('docPrefix');
  String get scanSuccess => _t('scanSuccess');
  String scanError(String e) => _t('scanError').replaceAll('{error}', e);
  String get uploadSuccess => _t('uploadSuccess');
  String uploadError(String e) => _t('uploadError').replaceAll('{error}', e);
  String get noLists => _t('noLists');
  String get createPackingLists => _t('createPackingLists');
  String get newList => _t('newList');
  String get listEmpty => _t('listEmpty');
  String get addItemsToList => _t('addItemsToList');
  String get person => _t('person');
  String get category => _t('category');
  String get inviteMember => _t('inviteMember');
  String get inviteFeatureWip => _t('inviteFeatureWip');
  String get tripNotFound => _t('tripNotFound');
  String get tripTitleLabel => _t('tripTitleLabel');
  String get required => _t('required');
  String get destination => _t('destination');
  String get description => _t('description');
  String get startDate => _t('startDate');
  String get endDate => _t('endDate');
  String get createTrip => _t('createTrip');
  String get tripCreated => _t('tripCreated');
  String get flight => _t('flight');
  String get train => _t('train');
  String get hotel => _t('hotel');
  String get activity => _t('activity');
  String get freeNote => _t('freeNote');
  String get editFlight => _t('editFlight');
  String get flightNumber => _t('flightNumber');
  String get selectDate => _t('selectDate');
  String get origin => _t('origin');
  String get boardingTime => _t('boardingTime');
  String get notes => _t('notes');
  String get save => _t('save');
  String get editTrain => _t('editTrain');
  String get trainNumber => _t('trainNumber');
  String get departureTime => _t('departureTime');
  String get editHotel => _t('editHotel');
  String get hotelName => _t('hotelName');
  String get address => _t('address');
  String get checkin => _t('checkin');
  String get checkout => _t('checkout');
  String get confirmationNumber => _t('confirmationNumber');
  String get editActivity => _t('editActivity');
  String get title => _t('title');
  String get place => _t('place');
  String get dateTime => _t('dateTime');
  String get duration => _t('duration');
  String get editNote => _t('editNote');
  String get content => _t('content');
  String get sectionFlight => _t('sectionFlight');
  String get sectionTrain => _t('sectionTrain');
  String get sectionHotel => _t('sectionHotel');
  String get sectionActivity => _t('sectionActivity');
  String get sectionNote => _t('sectionNote');
  String get flightNumberLabel => _t('flightNumberLabel');
  String get boarding => _t('boarding');
  String get number => _t('number');
  String get departure => _t('departure');
  String get confirmation => _t('confirmation');
  String get howToGet => _t('howToGet');
  String completedShort(int completed, int total) =>
      _t('completedShort').replaceAll('{completed}', '$completed').replaceAll('{total}', '$total');
  String get addToCalendar => _t('addToCalendar');
  String get exportItinerary => _t('exportItinerary');
  // Move/Copy
  String get copyToAnotherTrip => _t('copyToAnotherTrip');
  String get moveToAnotherTrip => _t('moveToAnotherTrip');
  String get selectTrip => _t('selectTrip');
  String get copiedToTrip => _t('copiedToTrip');
  String get movedToTrip => _t('movedToTrip');
  String get noOtherTrips => _t('noOtherTrips');
  String get tabAI => _t('tabAI');
  String get tabSandbox => _t('tabSandbox');
  String get askAboutTrip => _t('askAboutTrip');
  String get generate => _t('generate');
  String get aiPromptHint => _t('aiPromptHint');
  String get aiUnavailable => _t('aiUnavailable');
  String get addToSandbox => _t('addToSandbox');
  String get moveToItinerary => _t('moveToItinerary');
  String get addDraft => _t('addDraft');
  String get sandboxEmpty => _t('sandboxEmpty');
  String get moreInfo => _t('moreInfo');
  String get askAI => _t('askAI');
  String aiError(String e) => _t('aiError').replaceAll('{error}', e);
  String get edit => _t('edit');
  String get assign => _t('assign');
  String get manage => _t('manage');
  String get openNow => _t('openNow');
  String get listsLabel => _t('listsLabel');
  String get eventNotFound => _t('eventNotFound');
  String changeDateTo(String date) => _t('changeDateTo').replaceAll('{date}', date);
  String get yes => _t('yes');

  // Auth getters
  String get welcome => _t('welcome');
  String get signInSubtitle => _t('signInSubtitle');
  String get email => _t('email');
  String get password => _t('password');
  String minChars(int n) => _t('minChars').replaceAll('{n}', '$n');
  String get signIn => _t('signIn');
  String get signingIn => _t('signingIn');
  String get or => _t('or');
  String get continueWithGoogle => _t('continueWithGoogle');
  String get connecting => _t('connecting');
  String get noAccountSignUp => _t('noAccountSignUp');
  String get signInErrorGeneric => _t('signInErrorGeneric');
  String get invalidCredentials => _t('invalidCredentials');
  String get tooManyRequests => _t('tooManyRequests');
  String get networkError => _t('networkError');
  String get unexpectedError => _t('unexpectedError');
  String get googleSignInFailed => _t('googleSignInFailed');
  String get signInCancelled => _t('signInCancelled');
  String get createAccountTitle => _t('createAccountTitle');
  String get signUpSubtitle => _t('signUpSubtitle');
  String get name => _t('name');
  String get createAccount => _t('createAccount');
  String get creating => _t('creating');
  String get alreadyHaveAccountSignIn => _t('alreadyHaveAccountSignIn');
  String get signUpErrorGeneric => _t('signUpErrorGeneric');
  String get emailInUse => _t('emailInUse');
  String get invalidEmail => _t('invalidEmail');
  String get weakPassword => _t('weakPassword');
  String get operationNotAllowed => _t('operationNotAllowed');

  // Language screen
  String get chooseLanguageTitle => _t('chooseLanguageTitle');

  // Demo access
  String get tryDemo => _t('tryDemo');
  String get loadingDemo => _t('loadingDemo');

  // Places
  String get places => _t('places');
  String get addPlace => _t('addPlace');
  String get placesEmpty => _t('placesEmpty');
  String get addInterestingPlaces => _t('addInterestingPlaces');
  String get searchPlacesHint => _t('searchPlacesHint');
  String deletePlaceConfirm(String name) => _t('deletePlaceConfirm').replaceAll('{name}', name);
  String get categoryCafe => _t('categoryCafe');
  String get categoryBar => _t('categoryBar');
  String get categoryRestaurant => _t('categoryRestaurant');
  String get categoryAttraction => _t('categoryAttraction');
  String get categoryShop => _t('categoryShop');
  String get categoryOther => _t('categoryOther');

  // Helpers to build localized AI prompt seeds
  String aiPromptPlace(String place) {
    switch (locale.languageCode) {
      case 'es':
        return 'Analiza este lugar y dame overview, considerandos, tráfico/clima para la fecha, turismo, fan facts, servicios públicos y lugares cercanos (restaurantes, hostels, farmacias): $place';
      case 'pt':
        return 'Analise este lugar e dê overview, considerações, tráfego/clima para a data, turismo, curiosidades, serviços públicos e lugares próximos (restaurantes, hostels, farmácias): $place';
      case 'zh':
        return '请分析此地点，并给出概览、注意事项、交通/天气（按日期）、旅游建议、趣闻、公共服务以及附近的餐厅、青旅和药房：$place';
      case 'en':
      default:
        return 'Analyze this place and provide overview, considerations, traffic/weather for the date, tourism, fun facts, public services and nearby spots (restaurants, hostels, pharmacies): $place';
    }
  }
  String membersCount(int n) {
    switch (locale.languageCode) {
      case 'es':
        return n == 1 ? '1 miembro' : '$n miembros';
      case 'pt':
        return n == 1 ? '1 membro' : '$n membros';
      case 'zh':
        return '共 $n 位成员';
      case 'en':
      default:
        return n == 1 ? '1 member' : '$n members';
    }
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supported.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => SynchronousFuture(AppLocalizations(locale));

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
