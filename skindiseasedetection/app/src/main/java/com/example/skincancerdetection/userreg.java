package com.example.skincancerdetection;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class userreg extends AppCompatActivity {
    EditText e1,e2,e3,e4,e5,e6,e7;
    Button b1;
    SharedPreferences sh;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_userreg);

        e1=findViewById(R.id.editTextTextPersonName15);
        e2=findViewById(R.id.editTextTextPersonName16);
        e3=findViewById(R.id.editTextTextPersonName17);
        e4=findViewById(R.id.editTextPhone);
        e5=findViewById(R.id.editTextTextPersonName19);
        e6=findViewById(R.id.editTextTextPersonName20);
        e7=findViewById(R.id.editTextTextPassword);

        b1=findViewById(R.id.button8);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String sname=e1.getText().toString();
                String dob=e2.getText().toString();
                String pl=e3.getText().toString();
                String ph=e4.getText().toString();
                String des=e5.getText().toString();
                String uname=e6.getText().toString();
                String pass=e7.getText().toString();

                    if (sname.equalsIgnoreCase("")) {
                        e1.setError("enter your name");
                        e1.requestFocus();
                    }  else if (dob.equalsIgnoreCase("")) {
                        e2.setError("enter your place");
                        e2.requestFocus();
                    } else if (pl.equalsIgnoreCase("")) {
                        e3.setError("enter your post");
                        e3.requestFocus();
                    } else if (ph.equalsIgnoreCase("")) {
                        e4.setError("enter your phone");
                        e4.requestFocus();
                    }

                    else if(ph.length()!=10)
                    {
                        e4.setError("Invalid phoneno");
                    }

                    else if (des.equalsIgnoreCase("")) {
                        e5.setError("enter your email");
                        e5.requestFocus();
                    }else if (uname.equalsIgnoreCase("")) {
                        e6.setError("enter your username");
                        e6.requestFocus();
                    }
                    else if (pass.equalsIgnoreCase("")) {
                        e7.setError("enter your password");
                        e7.requestFocus();
                    }


                    else {
                        RequestQueue queue = Volley.newRequestQueue(userreg.this);
                        String url = "http://" + sh.getString("ip", "") + ":5000/userreg";

                        // Request a string response from the provided URL.
                        StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                // Display the response string.
                                Log.d("+++++++++++++++++", response);
                                try {
                                    JSONObject json = new JSONObject(response);
                                    String res = json.getString("task");

                                    if (res.equalsIgnoreCase("valid")) {
                                        Toast.makeText(userreg.this, "Registration success", Toast.LENGTH_SHORT).show();
                                        Intent i = new Intent(getApplicationContext(), Login.class);
                                        startActivity(i);

                                    } else {

                                        Toast.makeText(userreg.this, "Invalid ", Toast.LENGTH_SHORT).show();

                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }


                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {


                                Toast.makeText(getApplicationContext(), "Error" + error, Toast.LENGTH_LONG).show();
                            }
                        }) {
                            @Override
                            protected Map<String, String> getParams() {
                                Map<String, String> params = new HashMap<String, String>();
                                params.put("name", sname);
                                params.put("place", dob);
                                params.put("post", pl);

                                params.put("phone", ph);
                                params.put("email", des);
                                params.put("username", uname);
                                params.put("password", pass);

                                return params;
                            }
                        };
                        queue.add(stringRequest);
                    }
                }


        });

    }
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent ik = new Intent(getApplicationContext(), Login.class);
        startActivity(ik);
    }
}