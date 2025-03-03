import { Elm } from "./src/Main.elm"
// Elm.HelloWorld.init()
Elm.Main.init()
Elm.ports.sendData.subscribe(function (data) {
  console.log("Data from Elm: ", data);
});