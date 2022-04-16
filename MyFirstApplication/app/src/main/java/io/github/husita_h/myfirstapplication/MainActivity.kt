package io.github.husita_h.myfirstapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import io.github.husita_h.myfirstapplication.ui.theme.MyFirstApplicationTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyFirstApplicationTheme {
                MyApp()
            }
        }
    }
}

@Composable
fun MyApp(names:List<String> = listOf("World", "Compose")) {
    Column {
        for (name in names) {
            Greeting(name = name)
        }
    }
}

@Composable
private fun Greeting(name: String) {
    // 初期値をセット
    /* State と MutableState は、
    なんらかの値を保持し、
    その値が変化するたびに UI の更新（再コンポジション）を
    トリガーするインターフェースです。
     */
    var expanded = remember {
        mutableStateOf(false)
    }

    Surface(
        color = MaterialTheme.colors.primary,
        modifier = Modifier.padding(vertical = 4.dp, horizontal = 8.dp
        )
    ) {
        Row(modifier = Modifier.padding(24.dp)){
            Column(modifier = Modifier.weight(1f)) {
                Text(text = "Hello,")
                Text(text = name)
            }
            OutlinedButton(
                onClick = {
                    // expanded = !expanded
                    expanded.value = !expanded.value
                }
            ) {
               Text(
                   if (expanded.value) {
                       "Show Less!"
                   }else{
                       "Show More!"
                   }
               )
            }
        }
    }
}


@Preview(showBackground = true, widthDp = 320)
@Composable
fun DefaultPreview() {
    MyFirstApplicationTheme {
        MyApp()
    }
}
