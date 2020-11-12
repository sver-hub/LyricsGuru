package dev.stulov.spotify

import android.content.Intent
import android.app.Activity
import androidx.annotation.NonNull

import com.spotify.sdk.android.authentication.AuthenticationClient
import com.spotify.sdk.android.authentication.AuthenticationRequest
import com.spotify.sdk.android.authentication.AuthenticationResponse

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry


class SpotifyPlugin: FlutterPlugin, ActivityAware, MethodCallHandler, PluginRegistry.ActivityResultListener {

    private lateinit var channel: MethodChannel
    private lateinit var result: MethodChannel.Result
    private var activityBinding: ActivityPluginBinding? = null

    //connecting
    private val methodGetAccessToken = "getAccessToken"

    private val paramClientId = "clientId"
    private val paramRedirectUrl = "redirectUrl"
    private val paramScopes = "scopes"

    private val errorAccessToken = "ACCESS_TOKEN_ERROR"

    private val requestCode = 1337

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            methodGetAccessToken -> {
                this.result = result
                getAccessToken(call.argument(paramClientId), call.argument(paramRedirectUrl), call.argument(paramScopes))
            }
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "spotify")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
        activityBinding?.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityBinding = binding
        activityBinding?.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
    }

    //-- Method implementations
    private fun getAccessToken(clientId: String?, redirectUrl: String?, scopes: ArrayList<String>?) {
        if (activityBinding?.activity == null) {
            throw IllegalStateException("getAccessToken needs a foreground activity")
        }

        val builder = AuthenticationRequest.Builder(clientId, AuthenticationResponse.Type.TOKEN, redirectUrl)
        builder.setScopes(scopes?.toTypedArray())
        val request = builder.build()

        AuthenticationClient.openLoginActivity(activityBinding?.activity, this.requestCode, request)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, intent: Intent?): Boolean {
        return when (requestCode) {
            this.requestCode -> {
                authFlow(resultCode, intent)
                return true
            }
            else -> false
        }
    }

    private fun authFlow(resultCode: Int, intent: Intent?) {
        val response: AuthenticationResponse = AuthenticationClient.getResponse(resultCode, intent)
        
        when (response.type) {
            AuthenticationResponse.Type.TOKEN -> result.success(response.accessToken)
            AuthenticationResponse.Type.ERROR -> result.error(errorAccessToken, "Authentication went wrong", response.error)
            else -> result.notImplemented()
        }
    }
}