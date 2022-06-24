package kotlinspringbootdemo.kotlinspringbootdemo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("greeter")
class GreeterController {
    @GetMapping("/hello")
    fun hello(@RequestParam("name") name: String): HelloResponse{
        return HelloResponse("Hello ${name}")
    }

    @GetMapping("/hello/{name}")
    fun helloPathValue(@PathVariable("name") name: String): HelloResponse{
        return HelloResponse("Hello ${name}")
    }
}
