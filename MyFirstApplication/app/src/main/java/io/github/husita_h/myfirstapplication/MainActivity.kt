package io.github.husita_h.myfirstapplication

import android.content.res.Configuration.UI_MODE_NIGHT_YES
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.core.Spring
import androidx.compose.animation.core.spring
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.*
import androidx.compose.material.MaterialTheme.typography
import androidx.compose.material.icons.Icons
import androidx.compose.material.Icon
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
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
fun MyApp() {
    //var shouldShowOnboarding by remember { mutableStateOf(true) }
    var shouldShowOnboarding by rememberSaveable { mutableStateOf(true) }

    if (shouldShowOnboarding) {
        OnboardingScreen(onContinueClicked = { shouldShowOnboarding = false })
    } else {
        Greetings()
    }
}

@Composable
//private fun Greetings(names: List<String> = List(1000) { "$it" }) {
//private fun Greetings(names: List<String> = listOf("World", "Compose")) {
/*
スクロール可能な列を表示するには、LazyColumn を使用します。
LazyColumn は画面に表示されているアイテムのみをレンダリングするので、大きなリストを表示する場合は効率が良くなります。
*/
private fun Greetings(names: List<String> = List(1000) { "$it" } ) {
    LazyColumn(modifier = Modifier.padding(vertical = 4.dp)) {
        items(items = names) { name ->
            Greeting(name = name)
        }
    }
}

@Composable
private fun Greeting(name: String) {
    Card(
        backgroundColor = MaterialTheme.colors.primary,
        modifier = Modifier.padding(vertical = 4.dp, horizontal = 8.dp)
    ) {
        CardContent(name)
    }
}

// private fun Greeting(name: String) {
//     // 初期値をセット
//     /* `State`と`MutableState`はなんらかの値を保持し、
//     その値が変化するたびにUIの更新(再コンポジションをトリガーするインターフェースです。
//      */
//     var expanded by remember { mutableStateOf(false) }

//     val extraPadding by animateDpAsState(
//         if (expanded) 48.dp else 0.dp,
//         animationSpec = spring(
//             dampingRatio = Spring.DampingRatioMediumBouncy,
//             stiffness = Spring.StiffnessLow
//         )
//     )

//     Surface(
//         color = MaterialTheme.colors.primary,
//         modifier = Modifier.padding(vertical = 4.dp, horizontal = 8.dp)
//     ) {
//         Row(modifier = Modifier.padding(24.dp)){
//             // Column(modifier = Modifier
//             //     .weight(1f)
//             //     .padding(bottom = extraPadding.coerceAtLeast(0.dp))
//             // )
//             // {
//             //     Text(text = "Hello,")
//             //     Text(text = name)
//             // }
//             Column(modifier = Modifier
//                 .weight(1f)
//                 .padding(bottom = extraPadding.coerceAtLeast(0.dp)))
//             {
//                 Text(text = "Hello, ")
//                 Text(text = name, style = MaterialTheme.typography.h4.copy(
//                         fontWeight = FontWeight.ExtraBold
//                     )
//                 )
//             }
//             IconButton(onClick = { expanded = !expanded }) {
//                 Icon(
//                     imageVector = if (expanded) Filled.ExpandLess else Filled.ExpandMore,
//                     contentDescription = if (expanded) {
//                         stringResource(R.string.show_less)
//                     } else {
//                         stringResource(R.string.show_more)
//                     }

//                 )
//             }
//         }
//     }
// }

@Composable
private fun CardContent(name: String) {
    var expanded by remember { mutableStateOf(false) }

    Row(
        modifier = Modifier
            .padding(12.dp)
            .animateContentSize(
                animationSpec = spring(
                    dampingRatio = Spring.DampingRatioMediumBouncy,
                    stiffness = Spring.StiffnessLow
                )
            )
    ) {
        Column(
            modifier = Modifier
                .weight(1f)
                .padding(12.dp)
        ) {
            Text(text = "Hello, ")
            Text(
                text = name,
                style = typography.h4.copy(
                    fontWeight = FontWeight.ExtraBold
                )
            )
            if (expanded) {
                Text(
                    text = ("Composem ipsum color sit lazy, " +
                        "padding theme elit, sed do bouncy. ").repeat(4),
                )
            }
        }
        IconButton(onClick = { expanded = !expanded }) {
            Icon(
                imageVector = Filled.ExpandLess else Filled.ExpandMore,
                contentDescription = if (expanded) {
                    stringResource(R.string.show_less)
                } else {
                    stringResource(R.string.show_more)
                }

            )
        }
    }
}

@Composable
fun OnboardingScreen(onContinueClicked: () -> Unit) {

    Surface {
        Column(
            modifier = Modifier.fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text("Welcome to the My First Apps!")
            Button(
                modifier = Modifier.padding(vertical = 24.dp),
                onClick = onContinueClicked
            ) {
                Text("Continue")
            }
        }
    }
}

@Preview(showBackground = true, widthDp = 320)
@Composable
fun DefaultPreview() {
    MyFirstApplicationTheme {
        Greetings()
    }
}

@Preview(
    showBackground = true,
    widthDp = 320,
    uiMode = UI_MODE_NIGHT_YES,
    name = "DefaultPreviewDark"
)
@Preview(showBackground = true, widthDp = 320)
@Composable
fun DefaultDarkModePreview() {
    MyFirstApplicationTheme {
        Greetings()
    }
}

@Preview(showBackground = true, widthDp = 320, heightDp = 320)
@Composable
fun OnboardingPreview() {
    MyFirstApplicationTheme {
        OnboardingScreen(onContinueClicked = {})
    }
}
