# seguro_app

Aplicativo Flutter para gerenciamento de seguros desenvolvido usando a Clean Arch, com autenticação via CPF e senha. Desenvolvido para Android e Web, utilizando Firebase para autenticação e armazenamento.

---

## Funcionalidades

- Login com CPF e senha
- Persistência de sessão com `shared_preferences`
- Suporte para Android e Web
- Navegação e Injeção de Dependencias modular com `flutter_modular`
- Integração com Firebase Authentication
- WebView para conteúdos externos
- Formatação de CPF com máscara
- Ambiente configurável via `.env`
- Configuração Firebase Web via arquivo JSON externo (`firebase_config.json`)

---

## Tecnologias utilizadas

- Flutter (Android & Web)
- Firebase Core & Firebase Auth
- flutter_modular (modularização e injeção de dependência)
- shared_preferences (armazenamento local)
- flutter_dotenv (configuração via `.env`)
- webview_flutter (exibição de conteúdo web)
- mask_text_input_formatter (formatação de campos)
- flutter_triple (gerenciamento de estado)

---

## Requisitos

- Flutter SDK (>= 3.8.1)
- Conta Firebase configurada para seu app (Android e Web)
- Android Studio / VSCode para desenvolvimento
- Emulador Android ou dispositivo físico para testes
- Navegador compatível para testes Web

---

## Configuração inicial

1. Clone o repositório

```bash
git clone https://github.com/guilhermebernava/seguro_app.git
cd seguro_app
```

2. Crie um arquivo `.env` dentro da pasta assets com as credenciais Firebase (exemplo):

```env
FIREBASE_API_KEY=your_api_key
FIREBASE_APP_ID=your_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_STORAGE_BUCKET=your_storage_bucket
FIREBASE_AUTH_DOMAIN=your_auth_domain
```

3. Para Flutter Web **(IMPORTANTE)**, crie o arquivo `firebase_config.json` na pasta `web/` (não versionar este arquivo no git):

Exemplo de conteúdo `web/firebase_config.json`:

```json
{
  "apiKey": "your_api_key",
  "authDomain": "your_project.firebaseapp.com",
  "projectId": "your_project_id",
  "storageBucket": "your_storage_bucket",
  "messagingSenderId": "your_sender_id",
  "appId": "your_app_id",
  "measurementId": "your_measurement_id"
}
```

> **Obs:** Substitua os valores acima pelas suas chaves do Firebase.

4. Instale as dependências

```bash
flutter pub get
```

5. Configure Firebase para Android e Web conforme as instruções no console Firebase.

6. Para Android, verifique se o arquivo `google-services.json` está na pasta `android/app`.

7. Para Web, verifique se o arquivo `firebase_options.dart` está gerado e o `web/index.html` está configurado para carregar o arquivo `firebase_config.json` conforme o exemplo:

```html
<script type="module">
  import { initializeApp } from "https://www.gstatic.com/firebasejs/11.9.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/11.9.1/firebase-analytics.js";

  async function loadFirebaseConfig() {
    const response = await fetch("firebase_config.json");
    if (!response.ok) {
      throw new Error("Could not load Firebase config");
    }
    return await response.json();
  }

  loadFirebaseConfig()
    .then((firebaseConfig) => {
      const app = initializeApp(firebaseConfig);
      const analytics = getAnalytics(app);
      console.log("Firebase initialized");
    })
    .catch((err) => {
      console.error("Failed to initialize Firebase:", err);
    });
</script>
```

---

## Executando o app

- Para Android:

```bash
flutter run -d android
```

- Para Web:

```bash
flutter run -d chrome
```

---

## Estrutura do projeto

- `lib/app/modules/auth`: Login e cadastro (CPF + senha)
- `lib/app/modules/home`: Tela principal após login
- `lib/app/shared/stores`: Armazenamento local e gerenciamento de usuário
- `lib/app/core`: Temas, widgets reutilizáveis e helpers
- `lib/app/data`: Repositórios e fontes de dados (Firebase, local)
- `lib/app/domain`: Entidades e contratos (interfaces)
- `lib/firebase_options.dart`: Configuração Firebase via `.env`

---

## Considerações

- Certifique-se de proteger as chaves sensíveis e não versionar o `.env` nem o `firebase_config.json`.
- O app usa Flutter Modular para uma arquitetura limpa e modular.
- O login é feito via Firebase Auth usando e-mail gerado a partir do CPF.
- O app suporta persistência de login com `shared_preferences`.
