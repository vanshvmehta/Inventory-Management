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
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import com.dradh.cs446.Item
@Composable
fun createLocationList(locations: List<String>) {
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
                placeholder = { Text("Search locations...") },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 8.dp)
            )
            Row(
                modifier = Modifier
                    .fillMaxWidth()
            ) {
                Text(
                    text = "Locations",
                    style = TextStyle(fontWeight = FontWeight.Bold),
                    modifier = Modifier.fillMaxWidth()
                )
            }
            Spacer(modifier = Modifier.height(4.dp))
            Divider(color = Color.Gray, thickness = 1.dp, modifier = Modifier.padding(bottom = 8.dp))

            // Scrollable column for locations
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .verticalScroll(rememberScrollState())
            ) {
                locations.filter {
                    it.contains(searchText, ignoreCase = true)
                }.take(displayLimit).forEach { location ->
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = location,
                            style = TextStyle(fontWeight = FontWeight.Bold),
                            modifier = Modifier.fillMaxWidth(),
                            overflow = TextOverflow.Ellipsis,
                            maxLines = 1
                        )
                        IconButton(
                            onClick = {
                                // Handle remove location action
                                println("Remove $location")
                            },
                            modifier = Modifier.size(36.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Remove Location",
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
                            Text("Add Location", color = Color.White)
                        }
                    }
                )
            }

            // Add location dialog
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
                                .padding(horizontal = 20.dp, vertical = 16.dp)
                        ) {
                            Text(
                                text = "Add Location",
                                style = TextStyle(
                                    fontWeight = FontWeight.Bold,
                                    fontSize = 20.sp
                                ),
                                modifier = Modifier.padding(bottom = 16.dp)
                            )

                            var location by remember { mutableStateOf("") }

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
                                        // TODO: add location to DB
                                        println("Adding location: $location")
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