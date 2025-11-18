plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.cycleiq_saas_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // enable desugaring for core library APIs (java.time etc.)
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // use a plain string for jvmTarget to avoid the deprecation compile-time error
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.cycleiq_saas_mobile"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Desugaring library (required for coreLibraryDesugaringEnabled)
    // use dependencies.add(...) to be explicit in Kotlin DSL
    dependencies.add(
        "coreLibraryDesugaring",
        "com.android.tools:desugar_jdk_libs:2.1.5"
    )

    // your other dependencies remain as usual
}