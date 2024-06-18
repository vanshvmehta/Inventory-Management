package com.dradh.cs446.helpers

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun LoginScreen(modifier: Modifier) {
    // Initialize username and password state using remember and mutableStateOf
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }

    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        // Customize text style for white color
        val textStyle = TextStyle(color = Color.White)

        Text("Login", style = TextStyle(color = Color.White, fontSize = 30.sp))

        OutlinedTextField(
            value = username,
            onValueChange = { username = it },
            label = { Text("Username", style = textStyle) },
            textStyle = textStyle,
            modifier = Modifier.padding(vertical = 8.dp)
        )

        OutlinedTextField(
            value = password,
            onValueChange = { password = it },
            label = { Text("Password", style = textStyle) },
            textStyle = textStyle,
            modifier = Modifier.padding(vertical = 8.dp)
        )

        Button(
            onClick = {
                // Handle login logic here
                val enteredUsername = username
                val enteredPassword = password
                // Example: validate credentials
                if (enteredUsername.isNotBlank() && enteredPassword.isNotBlank()) {
                    // Process login (e.g., validate with backend, navigate to next screen)
                }
            },
            modifier = Modifier.padding(vertical = 16.dp)
        ) {
            Text("Submit")
        }
    }
}