package com.example.smart_farm

import android.app.Service
import android.content.Intent
import android.os.IBinder
import androidx.core.app.NotificationCompat

class SignalRForegroundService : Service() {

    override fun onCreate() {
        super.onCreate()
        // Tạo Notification cho Foreground Service
        val notification =
                NotificationCompat.Builder(this, "signalr_channel")
                        .setContentTitle("Smart Farm đang chạy")
                        .setContentText("Duy trì kết nối với máy chủ")
                        .setSmallIcon(R.drawable.ic_launcher_foreground) // Thay bằng icon của bạn
                        .build()

        startForeground(1, notification) // Bắt đầu Foreground Service
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // TODO: Kết nối SignalR từ đây
        // Bạn có thể dùng SignalR client đã tích hợp sẵn trong Flutter hoặc native
        return START_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()
        // TODO: Ngắt kết nối SignalR nếu cần
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }
}
