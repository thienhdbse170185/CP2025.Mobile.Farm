import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import com.example.smart_farm.R
import com.microsoft.signalr.HubConnectionBuilder

class SignalRService : Service() {

    private val hubConnection = HubConnectionBuilder.create("https://your-signalr-url").build()

    override fun onCreate() {
        super.onCreate()
        log("SignalRService", "Service created, preparing to start foreground service.")
        startForeground(1, createNotification("Service Running"))
        connectSignalR()
    }

    private fun connectSignalR() {
        log("SignalRService", "Preparing to connect to SignalR server.")
        hubConnection.on(
                "ReceiveNotification",
                { message: String -> showNotification(message) },
                String::class.java
        )

        try {
            log("SignalRService", "Starting connection to SignalR...")
            hubConnection.start()
            log("SignalRService", "Successfully connected to SignalR server")
        } catch (e: Exception) {
            log("SignalRService", "Failed to connect to SignalR server: $e")
        }
    }

    private fun createNotification(contentText: String): Notification {
        val channelId = "signalr_channel"
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            val channel =
                    NotificationChannel(
                            channelId,
                            "SignalR Notifications",
                            NotificationManager.IMPORTANCE_DEFAULT
                    )
            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager?.createNotificationChannel(channel)
        }
        log("SignalRService", "Creating notification: $contentText")
        return NotificationCompat.Builder(this, channelId)
                .setContentTitle("SignalR Service")
                .setContentText(contentText)
                .setSmallIcon(R.drawable.ic_launcher_foreground)
                .build()
    }

    private fun showNotification(message: String) {
        log("SignalRService", "Showing notification with message: $message")
        val notification =
                NotificationCompat.Builder(this, "signalr_channel")
                        .setContentTitle("New SignalR Message")
                        .setContentText(message)
                        .setSmallIcon(R.drawable.ic_launcher_foreground)
                        .build()

        val notificationManager = getSystemService(NotificationManager::class.java)
        notificationManager?.notify(2, notification)
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    private fun log(tag: String, message: String) {
        Log.d(tag, message) // Using Log.d to log debug information
    }
}
