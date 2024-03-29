## An Example with NavigationStack to create an App router uniquely and simply.

### Setup
1. create an enum name as 'AppRouter' which confirms the Hashable protocol. Define app navigation as cases inside the enum. Example:
   ```
   enum AppRouter: Hashable {
    case login(LoginViewModel)
    case registration(RegistrationViewModel)
    case profile(ProfileViewModel)
    case none

    static func == (lhs: AppRouter, rhs: AppRouter) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
   
    func hash(into hasher: inout Hasher) {
        var index = 0
        switch self {
        case .login:
            index = 1
        case .registration:
            index = 2
        case .profile:
            index = 3
        case .none:
            index = 0
        }
        //
        hasher.combine(index)
     }
    }
    ```

2. Create an extension of View and add the below code
   ```extension View {
    @ViewBuilder
    func buildNextView(navDestination: AppRouter?) -> some View {
        switch navDestination {
        case .login(let vm):
            LoginView(viewModel: vm) // Or pass as: environmentObject(vm)
        case .profile(let vm):
            ProfileView().environmentObject(vm)
        case .registration(let vm):
            RegistrationView().environmentObject(vm)
        case nil:
            EmptyView()
        default:
            EmptyView()
        }
    } }
   ```

3. Create a class name as NavigationStore which confirms the ObservableObject protocol. This class will help in navigation via NavigationStack
   ```final class NavigationStore: ObservableObject {
      @Published var path = NavigationPath()
      func popToRoot() {
        path = NavigationPath()
     }
   }  ```

4. Create a ViewModel as below
   ```
   protocol RootViewModelProtocol: ObservableObject {
    var appRouter: AppRouter? { get set }
    var navigateToLoginTitle: String { get }
    var navigateToRegistartionTitle: String { get }
    var navigationTitle: String { get }
    func navigateToLogin()
    func navigateRegistration()
   }
   
   class RootViewModel: RootViewModelProtocol {
    @Published var appRouter: AppRouter? = nil
    private lazy var loginViewModel = LoginViewModel()
    private lazy var registrationViewModel = RegistrationViewModel()
    
    var navigateToLoginTitle: String {
        "Login"
    }
    var navigateToRegistartionTitle: String {
        "Register"
    }
    var navigationTitle: String {
        "Router Example"
    }
    func navigateToLogin() {
        appRouter = .login(LoginViewModel())
    }
    func navigateRegistration() {
        appRouter = .registration(RegistrationViewModel())
    }
   }
   ```
5. Now in your view
   ```
   struct RootView<ViewModel: RootViewModelProtocol>: View {
    @EnvironmentObject var navigationStore: NavigationStore
    @ObservedObject var viewModel: ViewModel
    var body: some View {
          VStack {
             createButtonWithTitle(title: viewModel.navigateToLoginTitle, action: viewModel.navigateToLogin)
            
             createButtonWithTitle(title: viewModel.navigateToRegistartionTitle, action: viewModel.navigateRegistration)
          }
          .navigationTitle(viewModel.navigationTitle)
          .navigationDestination(item: $viewModel.appRouter) { _ in
              buildNextView(navDestination: viewModel.appRouter)
                  .environmentObject(navigationStore)

          }
    }
  }
   ```
