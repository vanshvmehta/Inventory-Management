package com.dradh.cs446
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.dradh.cs446.helpers.LoginScreen
import com.dradh.cs446.ui.theme.AssetAllyTheme
import createFormattedList
import createLocationList

data class Item(val name: String, val price: Double, val quantity: Int, val location: String)

class MainActivity : ComponentActivity() {
    val items = listOf(
        Item("Item 1", 10.0, 5, "Loc A"),
        Item("Item 2", 15.0, 3, "Loc B"),
        Item("Item 3", 20.0, 8, "Loc C"),
        Item("Item 4", 20.0, 8, "Loc A"),
        Item("Item 5", 20.0, 8, "Loc B"),
        Item("Item 6", 20.0, 8, "Loc A"),
        Item("Item 7", 20.0, 8, "Loc C"),
    )

//    TODO: THIS SHOULD BE all locations for account
    val locations = listOf(
        "Loc A", "Loc B", "Loc C"
    )
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            AssetAllyTheme {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(MaterialTheme.colorScheme.tertiary),
                    contentAlignment = Alignment.Center
                ) {
                    // Swap screens here

//                    LOGIN PAGE
//                    TODO: add functionality
//                    Check if logged in... if so pull items
//                    LoginScreen(modifier = Modifier)

//                    LOCATION PAGE
//                    TODO: add location functionality here
//                      createLocationList(locations)

//                    CHART COMPONENT for ITEMS
//                    TODO: Embed this in a new view + add functions
//                    createFormattedList(items)

                }
            }
        }
    }
}


@Composable
fun CreateCompany() {

}

@Composable
fun CreateLocation() {

}



@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.tertiary),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = "Hello $name!",
            color = Color.Black,
            modifier = Modifier.padding(16.dp),
            textAlign = TextAlign.Center // Center align the text
        )
    }
}