package com.example.dinogarden;

import io.flutter.embedding.android.FlutterActivity;
// import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbManager;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;


import com.hoho.android.usbserial.driver.UsbSerialDriver;
import com.hoho.android.usbserial.driver.UsbSerialPort;
import com.hoho.android.usbserial.driver.UsbSerialProber;
import com.hoho.android.usbserial.util.SerialInputOutputManager;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executors;

//import android.support.v7.app.AppCompatActivity;
//import com.benlypan.usbhid.OnUsbHidDeviceListener;
//import com.benlypan.usbhid.UsbHidDevice;
//import com.google.gson.Gson;
//import com.google.gson.reflect.TypeToken;

//import es.rcti.printerplus.printcom.models.PrintTool;
//import es.rcti.printerplus.printcom.models.StructReport;

//https://github.com/rcties/PrinterPlusCOMM
//https://github.com/mik3y/usb-serial-for-android
public class MainActivity extends FlutterActivity  implements SerialInputOutputManager.Listener{
    private static final String ACTION_USB_PERMISSION = "com.android.recipes.USB_PERMISSION";
    private static final String INTENT_ACTION_GRANT_USB = "com.example.dinogarden" + ".GRANT_USB";
    UsbSerialPort port;

    MQTTService mqttService;

    private Thread readThread;

    private boolean mRunning;


    //private UsbHidDevice device = null;

    private static final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();
    public static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX_ARRAY[v >>> 4];
            hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars);
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // MQTT Service

        mqttService = new MQTTService(this);
        mqttService.setCallback(new MqttCallbackExtended() {
            @Override
            public void connectComplete(boolean reconnect, String serverURI) {

            }

            @Override
            public void connectionLost( Throwable throwable){

            }

            @Override
            public void messageArrived(String topic, MqttMessage message) throws Exception {
                String data_to_microbit = message.toString();
                Log.w("Mqtt", data_to_microbit);
                // Json parser
            }

            @Override
            public void deliveryComplete( IMqttDeliveryToken token) {

            }
        });

        UsbManager manager = (UsbManager) getSystemService(Context.USB_SERVICE);
        List<UsbSerialDriver> availableDrivers = UsbSerialProber.getDefaultProber().findAllDrivers(manager);


        if (availableDrivers.isEmpty()) {
            Log.d("UART", "UART is not available");
            Toast.makeText(MainActivity.this, "UART is not available", Toast.LENGTH_LONG).show();
        }else {
            Log.d("UART", "UART is available");
            Toast.makeText(MainActivity.this, "UART is available", Toast.LENGTH_LONG).show();
            UsbSerialDriver driver = availableDrivers.get(0);
            UsbDeviceConnection connection = manager.openDevice(driver.getDevice());
            if (connection == null) {
                PendingIntent usbPermissionIntent = PendingIntent.getBroadcast(this, 0, new Intent(INTENT_ACTION_GRANT_USB), 0);
                manager.requestPermission(driver.getDevice(), usbPermissionIntent);
                manager.requestPermission(driver.getDevice(), PendingIntent.getBroadcast(this, 0, new Intent(ACTION_USB_PERMISSION), 0));
            } else {
                // Most devices have just one port (port 0)
                port = driver.getPorts().get(0);
                try {
                    port.open(connection);
                    port.setParameters(115200, 8, UsbSerialPort.STOPBITS_1, UsbSerialPort.PARITY_NONE);
                    port.write("hello abc#".getBytes(), 1000);
                    Toast.makeText(MainActivity.this, "A sample string is sent", Toast.LENGTH_LONG).show();

                    SerialInputOutputManager usbIoManager = new SerialInputOutputManager(port, this);
                    Executors.newSingleThreadExecutor().submit(usbIoManager);
                } catch (Exception e) {
                    Toast.makeText(MainActivity.this, "Sending a message is fail", Toast.LENGTH_LONG).show();
                }

            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        try {
            port.close();
        }catch (Exception e) {

        }
    }


    @Override
    public void onNewData(final byte[] data) {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Log.d("dataAA", Arrays.toString(data));
            }
        });
    }

    @Override
    public void onRunError(Exception e) {

    }

    private void sendDataMQTT( String data){
        MqttMessage msg = new MqttMessage();
        msg.setId(1234);
        msg.setQos(0);
        msg.setRetained(true);

        byte[] b = data.getBytes(Charset.forName("UTF-8"));
        msg.setPayload(b);

        Log.d("ABC","Publish: " + msg);
        try {
            mqttService.mqttAndroidClient.publish("[Your path to the feed you want to send message]", msg);
        } catch ( MqttException e){
            Log.d("MQTT", "sendDataMQTT: cannot send message");
        }
    }
}


