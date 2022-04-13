# ride_activity
    仲間と自転車ライフを楽しくする！
    Ride Activity

## create a new repository on the command line
1. 新しいリポジトリを作る（read meは作らない）
    https://github.com/hiramatsuYoshiaki/ride_activity.git
2. git init
3. git add -A
4. git commit -m "first commit"
5. git branch -M main
6. git remote add origin https://hiramatsuYoshiaki:ghp_xxxxx@github.com/hiramatsuYoshiaki/ride_activity.git
7. git push -u origin main

# FlutterのFirebaseを知る (チュートリアル)
https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=en#0


1. 始める前に  
2. サンプルコードを取得します  
    `git clone https://github.com/flutter/codelabs.git flutter-codelabs`
3. Firebaseプロジェクトを作成して設定します  
    3-1 Firebaseプロジェクトを作成する。今回は以下のプロジェクトを使用。  
        project name : ride-activity  
        project id : ride-activity  
    3-2 Firebase認証のメールログインを有効にする  
    3-3 CloudFirestoreを有効にする  
4. Firebaseの構成 
    (flutterfire CLI tool)
    4-1 依存関係を構成する  
    4-1-1 firebase_coreは、FirebaseFlutterプラグインに必要な共通のコードです。  
        `$ flutter pub add firebase_core `  
    4-1-2 firebase_auth、Firebaseの認証機能との統合を可能にします。  
        `$ flutter pub add firebase_auth`  
    4-1-3 cloud_firestore、CloudFirestoreデータストレージへのアクセスを有効にします。  
        `$ flutter pub add cloud_firestore`  
    4-1-4 必要なパッケージを追加すると同時に、Firebaseを適切に利用するようにiOS、Android、macOS、およびWebランナープロジェクトを構成する必要があります。providerまた、ビジネスロジックを表示ロジックから分離できるようにするパッケージを使用しています。  
        `$ flutter pub add provider`  
    4-2 アプリの構成  
        `$ flutterfire configure`  
        プロセスをガイドを選択  
        4-2-1 Firebaseプロジェクトの選択  
        4-2-2 構成するプラットフォーム（Android、iOS、macOS、Webなど）を入力します。  
        4-2-3 選択したプラットフォームのどのFirebaseアプリケーションを使用して構成を抽出する必要があるかを特定します。デフォルトでは、CLIは現在のプロジェクト構成に基づいてFirebaseアプリを自動的に照合しようとします。  
        4-2-4 プロジェクトでfirebase_options.dartファイルを生成します。  
    
    ```
    flutterfire configure

    i Found 22 Firebase projects.
    ? Select a Firebase project to configure your Flutter application with ›
        ✔ Select a Firebase project to configure your Flutter application with · ride-activity (ride-activity)
    ? Which platforms should your configuration support (use arrow keys & space to select)? 
    ✔ Which platforms should your configuration support (use arrow keys & space to select)? 
    · android, ios, web
    i Firebase android app com.example.ride_activity is not registered on Firebase project ride-activity.
    i Registered a new Firebase android app on Firebase project ride-activity.
    ? Which ios bundle id do you want to use for this configuration, e.g. 'com.example.app'?✔ Which ios bundle id do you want to use for this configuration, e.g. 'com.example.app'? · bundle id
    i Firebase ios app bundle id is not registered on Firebase project ride-activity.       
    i Registered a new Firebase ios app on Firebase project ride-activity.
    FirebaseCommandException: An error occured on the Firebase CLI when attempting to run a 
    command.
    COMMAND: firebase apps:create ios ride_activity (ios) --bundle-id=bundle id --json --project=ride-activity
    ERROR: Failed to create iOS app for project ride-activity. See firebase-debug.log for more info.


    ```
