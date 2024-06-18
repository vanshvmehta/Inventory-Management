import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import com.dradh.cs446.Item

// Assuming Item class is defined as:
// data class Item(val name: String, val price: Double, val quantity: Int, val location: String)

@Composable
fun createFormattedList(items: List<Item>) {
    var searchText by remember { mutableStateOf("") }
    var displayLimit by remember { mutableStateOf(5) }
    var showDialog by remember { mutableStateOf(false) }

    Box(
        modifier = Modifier
            .padding(18.dp)
            .background(Color.LightGray)
            .height(IntrinsicSize.Min)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp)
        ) {
            TextField(
                value = searchText,
                onValueChange = { searchText = it },
                placeholder = { Text("Search items...") },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 8.dp)
            )
            Row(
                modifier = Modifier
                    .fillMaxWidth()
            ) {
                Text(
                    text = "Name",
                    style = TextStyle(fontWeight = FontWeight.Bold),
                    modifier = Modifier.width(120.dp)
                )
                Text(
                    text = "Price",
                    style = TextStyle(fontWeight = FontWeight.Bold),
                    modifier = Modifier.width(80.dp)
                )
                Text(
                    text = "Qty",
                    style = TextStyle(fontWeight = FontWeight.Bold),
                    modifier = Modifier.width(60.dp)
                )
                Text(
                    text = "Location",
                    style = TextStyle(fontWeight = FontWeight.Bold),
                    modifier = Modifier.fillMaxWidth()
                )
            }
            Spacer(modifier = Modifier.height(4.dp))
            Divider(color = Color.Gray, thickness = 1.dp, modifier = Modifier.padding(bottom = 8.dp))

            // Scrollable column for items
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .verticalScroll(rememberScrollState())
            ) {
                items.filter {
                    it.name.contains(searchText, ignoreCase = true) ||
                            it.location.contains(searchText, ignoreCase = true)
                }.take(displayLimit).forEach { item ->
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = item.name,
                            style = TextStyle(fontWeight = FontWeight.Bold),
                            modifier = Modifier.width(120.dp),
                            overflow = TextOverflow.Ellipsis,
                            maxLines = 1
                        )
                        Text(
                            text = "${item.price}",
                            modifier = Modifier.width(80.dp),
                            overflow = TextOverflow.Ellipsis,
                            maxLines = 1
                        )
                        Text(
                            text = "${item.quantity}",
                            modifier = Modifier.width(60.dp),
                            overflow = TextOverflow.Ellipsis,
                            maxLines = 1
                        )
                        Text(
                            text = item.location,
                            modifier = Modifier.weight(1f),
                            overflow = TextOverflow.Ellipsis,
                            maxLines = 1
                        )
                        IconButton(
                            onClick = {
                                // TODO: remove item from items
                                println("Remove ${item.name}")
                            },
                            modifier = Modifier.size(36.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Remove Item",
                                tint = Color.Red
                            )
                        }
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                }
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.Start,
                    verticalAlignment = Alignment.CenterVertically,
                    content = {
                        TextButton(
                            onClick = { displayLimit += 5 },
                            modifier = Modifier
                                .padding(8.dp)
                                .background(
                                    color = MaterialTheme.colorScheme.primary.copy(alpha = 0.5f),
                                    shape = MaterialTheme.shapes.medium
                                )
                        ) {
                            Text("View More", color = Color.White)
                        }

                        TextButton(
                            onClick = { showDialog = true },
                            modifier = Modifier
                                .padding(8.dp)
                                .background(MaterialTheme.colorScheme.primary, shape = MaterialTheme.shapes.medium)
                        ) {
                            Text("Add item", color = Color.White)
                        }
                    }
                )
            }

            // Add item dialog
            if (showDialog) {
                Dialog(
                    onDismissRequest = { showDialog = false },
                    properties = DialogProperties(dismissOnClickOutside = true),
                    content = {
                        Column(
                            modifier = Modifier
                                .padding(16.dp)
                                .background(Color.White)
                                .fillMaxWidth()
                                .padding(horizontal = 20.dp, vertical = 16.dp) // Adjust padding here
                        ) {
                            Text(
                                text = "Add Item",
                                style =TextStyle(fontWeight = FontWeight.Bold, fontSize = 20.sp),
                                modifier = Modifier.padding(bottom = 16.dp)
                            )

                            var name by remember { mutableStateOf("") }
                            var price by remember { mutableStateOf("") }
                            var quantity by remember { mutableStateOf("") }
                            var location by remember { mutableStateOf("") }

                            TextField(
                                value = name,
                                onValueChange = { name = it },
                                placeholder = { Text("Name") },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 8.dp)
                            )
                            TextField(
                                value = price,
                                onValueChange = { price = it },
                                placeholder = { Text("Price") },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 8.dp)
                            )
                            TextField(
                                value = quantity,
                                onValueChange = { quantity = it },
                                placeholder = { Text("Quantity") },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 8.dp)
                            )
                            TextField(
                                value = location,
                                onValueChange = { location = it },
                                placeholder = { Text("Location") },
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 8.dp)
                            )

                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(top = 8.dp),
                                horizontalArrangement = Arrangement.End
                            ) {
                                TextButton(
                                    onClick = { showDialog = false },
                                    modifier = Modifier.padding(end = 8.dp)
                                ) {
                                    Text("Cancel")
                                }
                                TextButton(
                                    onClick = {
                                        // TODO: add item to backend
                                        println("Adding item: $name, $price, $quantity, $location")
                                        showDialog = false
                                    }
                                ) {
                                    Text("Add")
                                }
                            }
                        }
                    }
                )
            }
        }
    }
}
