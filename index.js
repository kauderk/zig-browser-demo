const imports = {
  env: {
    print(result) {
      document.getElementById('text').innerHTML = `The result is ${result}`
    },
  },
}

try {
  const response = await fetch('main.wasm')
  const bytes = await response.arrayBuffer()
  const result = await WebAssembly.instantiate(bytes, imports)
  const add = result.instance.exports.add
  add(1, 2)
} catch (err) {
  console.log(err)
}
