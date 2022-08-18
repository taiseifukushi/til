package kotlinspringbootdemo.kotlinspringbootdemo

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("hello")
class HelloController {
    @GetMapping("/world")
    fun index(model: Model): String {
        model.addAttribute("message", "Hello World!")
        return "index"
    }
}