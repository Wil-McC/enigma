## Wil McCauley - Enigma Project Self-Evaluation

### Functionality
  * self-score: 3
    * Enigma class with `encrypt` and `decrypt` methods functioning to spec
    * Encrypt and decrypt CLI implemented successfully

### OOP
  * self-score: 3
    * Project is broken into logical components. `Enigma` calls on `Shifter` and doesn't store key/date info locally. Only `Shifter` keeps track of key and date string data.
    * `Enigma` and `Shifter` call on a `Generator` `module` which handles random number generation and date-squaring/slicing for key and offset default values, as well as methods to generate valid character array and numbers-as-strings array.

### Ruby Conventions
  * self-score: 3
    * Code is mostly or entirely well indented and formatted. Naming conventions are followed, though I used `Generator` for my module instead of `Generatable`, partly because the latter is not a proper word.
    * I use the `map` `Enumerable` in my `encrypt` and `decrypt` methods, allowing the efficient usage of `.join` to get the final string concatenated.
    * I implement a hash to store the shifts by type (ABCD), allowing efficient lookup for the final shifting operation.

### TDD
  * self-score: 4
    * Mocks and stubs are used in several places to remove `Time` headaches in testing and to remove randomness from mehtods like the random `key_gen` in the `Generator` module.
    * Module methods are tested against the module itself and on each class that includes the module. Test coverage is at 100%.
