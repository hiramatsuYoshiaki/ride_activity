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
#firebase hosthin 
https://www.flutter-study.dev/host-web-app/hosting
1. ウェブアプリのルート ディレクトリでGoogle へのログインする.
    `$ firebase login`
2. プロジェクトの開始
    `$ firebase init`
3. 選択する。　
    「Use an existing project」を選択しEnter　
    使用するプロジェクトを選択しEnter　
    「? What do you want to use as your public directory?」に 「build/web」 を入力　
    「? Configure as a single-page app (rewrite all urls to /index.html)?」に 「N」 を入力　

```
        ? Are you ready to proceed? Yes
        ? Which Firebase features do you want to set up for this directory? Press Space to select features, then Enter to confirm your choices. Firestore: Configure security rules and indexes files for Firestore, Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys, Storage: Configure a security rules file for Cloud Storage

        === Project Setup

        First, let's associate this project directory with a Firebase project.
        You can create multiple project aliases by running firebase use --add, 
        but for now we'll just set up a default project.

        ? Please select an option: Use an existing project
        ? Select a default Firebase project for this directory: ride-activity (ride-activity)
        i  Using project ride-activity (ride-activity)

        === Firestore Setup

        Firestore Security Rules allow you to define how and when to allow
        requests. You can keep these rules in your project directory      
        and publish them with firebase deploy.

        ? What file should be used for Firestore Rules? firestore.rules

        Firestore indexes allow you to perform complex queries while
        maintaining performance that scales with the size of the result
        set. You can keep index definitions in your project directory
        and publish them with firebase deploy.

        ? What file should be used for Firestore indexes? firestore.indexes.json

        === Hosting Setup

        Your public directory is the folder (relative to your project directory) that
        will contain Hosting assets to be uploaded with firebase deploy. If you
        have a build process for your assets, use your build's output directory.

        ? What do you want to use as your public directory? build/web
        ? Configure as a single-page app (rewrite all urls to /index.html)? No
        ? Set up automatic builds and deploys with GitHub? No
        +  Wrote build/web/404.html
        +  Wrote build/web/index.html

        === Storage Setup

        Firebase Storage Security Rules allow you to define how and when to allow
        uploads and downloads. You can keep these rules in your project directory
        and publish them with firebase deploy.

        ? What file should be used for Storage Rules? storage.rules
        +  Wrote storage.rules

        i  Writing configuration info to firebase.json...
        i  Writing project information to .firebaserc...

        +  Firebase initialization complete!
```

4. Webアプリをビルドする 
    `$ flutter build web` 
5. Webアプリをアップロードする 
    `$ firebase deploy` 
    Project Console: https://console.firebase.google.com/project/ride-activity/overview  
    Hosting URL: https://ride-activity.web.app  

# ImageオブジェクトをImageProviderにフラッターします 
https://stackoverflow.com/questions/58870443/flutter-image-object-to-imageprovider
```
Container(
  decoration: BoxDecoration(
    color: Colors.green,
    image: DecorationImage(
      image: img // <-- Expecting ImageProvider
    )
)
```
1. イメージピッカー(image_picker_web.dart)を使って画像をダウンロード
```
final _pickedImages = <Image>[];
  // final _pickedVideos = <dynamic>[];
  String _imageInfo = '';
  Future<void> _pickImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsWidget();
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
        print(fromPicker);
      });
    }
  }
```
2. _pickedImagesには、MemoryImageが保存される
`[Image(image: MemoryImage(Uint8List#1c3c8, scale: 1), frameBuilder: null, loadingBuilder: null, alignment: Alignment.center, this.excludeFromSemantics: false, filterQuality: low), Image(image:`
3. 画像をコンテナ(CircleAvater)の背景として配置したいが、backgroundImageはImageProviderのみを受け入れますので、ImageMemoryをImageProviderに変換します。imgをimg.imageに変更します。（ImageProviderを呼び出変換します。）

```
 _pickedImages
    .map(
        (img) => CircleAvatar(
        // backgroundImage: NetworkImage('$img'),
        // backgroundImage: NetworkImage('$img'),
        backgroundImage: img.image,// <-- Expecting ImageProvider
        minRadius: 50,
        maxRadius: 50,
        // child: img,
        ),
    )
    .toList(),
```
4. 参考：画像を指定するさまざまな方法のために、いくつかのコンストラクターが提供されています。 
https://api.flutter.dev/flutter/widgets/Image-class.html 


- Image.new、ImageProviderから画像を取得するため。
- Image.asset 、キーを使用してAssetBundleから画像を取得し ます。
- Image.network、URLから画像を取得します。
- Image.file、ファイルから画像を取得するため。
- Image.memory、Uint8Listから画像を取得します。
次の画像形式がサポートされています：JPEG、PNG、GIF、アニメーションGIF、WebP、アニメーションWebP、BMP、およびWBMP。追加のフォーマットは、基盤となるプラットフォームでサポートされる場合があります。FlutterはプラットフォームAPIを呼び出して認識されない形式をデコードしようとします。プラットフォームAPIが画像のデコードをサポートしている場合、Flutterは画像をレンダリングできます。




# Cloud Firestore にデータを追加する
 `https://firebase.google.com/docs/firestore/manage-data/add-data#dart_1` 