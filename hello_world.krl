ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
  
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }
  rule hello_monkey {
    select when echo monkey
    pre{
      //text = event:attr("text").defaultsTo("Monkey").klog()
      text = (event:attr("text")) => "Hello " + event:attr("text") | "Hello Monkey"
    }
    //send_directive("Hello "+ text)
    send_directive(text)
    
  }
  
}






