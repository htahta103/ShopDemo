package com.example.ShopDemo
import androidx.annotation.CallSuper
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingService
class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    @CallSuper
    override fun onCreate() {
        super.onCreate()
//        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

    override fun registerWith(pluginRegistry: PluginRegistry) {
//        FirebaseMessagingPlugin.registerWith(pluginRegistry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
    }
}