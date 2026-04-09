import 'package:get_it/get_it.dart';
import 'package:irischat_flutter/share/api/api_client.dart';
import 'package:irischat_flutter/share/logic/auth/i_auth_provider.dart';

// --- IMPORT INTERFACES (Hợp đồng ở Core/Share) ---
import '../../share/logic/auth/i_auth_repository.dart';
import '../../features/auth/logic/auth_provider_impl.dart';

// --- IMPORT IMPLEMENTATIONS (Thực thi ở Features) ---
import '../../features/auth/data/auth_api.dart';
import '../../features/auth/data/auth_repository_impl.dart';

// sl: Service Locator (Biến toàn cục để truy cập kho ở khắp nơi)
final sl = GetIt.instance;

Future<void> setupLocator() async {
  // --- 0. CLIENT (Cái này chứa Dio bên trong) ---
  sl.registerLazySingleton(() => ApiClient());

  // --- 1. DATA SOURCES / API ---
  // Đăng ký AuthApi để dùng cho Repository
  sl.registerLazySingleton(() => AuthApi(sl<ApiClient>()));

  // --- 2. REPOSITORIES (Sử dụng Interface) ---
  // Khi hệ thống hỏi IAuthRepository, trả về bản thực thi AuthRepositoryImpl
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(sl<AuthApi>()),
  );

  // --- 3. LOGIC / PROVIDERS (Sử dụng Interface) ---
  // Khi hệ thống hỏi IAuthProvider, trả về bản thực thi AuthProviderImpl
  // Dùng registerLazySingleton để giữ trạng thái User xuyên suốt App
  sl.registerLazySingleton<IAuthProvider>(
    () => AuthProviderImpl(sl<IAuthRepository>()),
  );

  // Sau này bạn thêm các tính năng khác vào đây:
  // sl.registerLazySingleton<IChatRepository>(() => ChatRepositoryImpl(sl()));
  // sl.registerLazySingleton<IChatProvider>(() => ChatProviderImpl(sl()));
}
