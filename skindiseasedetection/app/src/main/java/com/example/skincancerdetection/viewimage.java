package com.example.skincancerdetection;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class viewimage extends AppCompatActivity {
    ImageView i1;
    SharedPreferences sh;
    String url="",fn,res;
    TextView t1,t2;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viewimage);
        i1=findViewById(R.id.imageView);
        t1=findViewById(R.id.textView);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        fn=getIntent().getStringExtra("fn");
        t1.setText(getIntent().getStringExtra("res"));

//        t2 = findViewById(R.id.textView4);

        java.net.URL thumb_u;

        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy =
                    new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }


        try {


            thumb_u = new java.net.URL("http://" + sh.getString("ip", "") + ":5000/static/upload/" + fn);
            Drawable thumb_d = Drawable.createFromStream(thumb_u.openStream(), "src");
            i1.setImageDrawable(thumb_d);
        }
        catch (Exception e)
        {


        }



        RequestQueue queue = Volley.newRequestQueue(viewimage.this);
        url ="http://"+sh.getString("ip", "") + ":5000/viewimage";

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url,new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                // Display the response string.
                Log.d("+++++++++++++++++",response);
                try {

                    JSONArray ar=new JSONArray(response);

                    {
                        JSONObject jo=ar.getJSONObject(0);
                        t2.setText(jo.getString("remedy"));


//        i2.setImageDrawable(Drawable.createFromPath(getIntent().getStringExtra("photo"))));

                    }


                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

                Toast.makeText(getApplicationContext(),"Error",Toast.LENGTH_LONG).show();
            }
        }){
            @Override
            protected Map<String, String> getParams()
            {
                Map<String, String>  params = new HashMap<String, String>();

                params.put("disese",res);

                return params;
            }
        };
        // Add the request to the RequestQueue.
        queue.add(stringRequest);






    }
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent ik = new Intent(getApplicationContext(), home.class);
        startActivity(ik);
    }


}