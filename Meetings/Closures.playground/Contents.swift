//CLOSURES

/*
O uso de funções pode ser feito como qualquer outro tipo, como Strings ou Ints, por exemplo. Ou seja, pode-se criar uma função e atribuir a ela uma variável; chamar essa função através de uma variável; e passar essa função para outras funções como parâmetro
 
 Para essas funções específicas, damos o nome de closure.
 */

/*
 Pela documentação oficial da Apple: Closures são blocos auto-contidos de código que podem ser passadas e utilizadas no seu código.
 
 Em outras palavras, uma closure é um bloco de código que você pode atribuir a uma variável. Você pode então passá-lo em seu código, por exemplo, para outra função. Essa função então chama a closure e executa seu código, como se a closure fosse uma função comum.
 
 Uma analogia legal que vi em um site:
 1. Bob dá uma instrução a Alice e diz a ela: “Acene com as mãos!” Alice ouve a instrução e acena com as mãos. O aceno de mão é uma função que Bob chamou diretamente.
 2. Alice escreve sua idade em um pedaço de papel e o dá a Bob. O pedaço de papel é uma variável. Alice usou o pedaço de papel para armazenar alguns dados.
 3. Bob escreve “Acene com as mãos!” em um pedaço de papel e dá para Alice. Alice lê as instruções no pedaço de papel e acena com as mãos. A instrução, passada no pedaço de papel, é uma closure.
 4. Mais tarde, podemos enviar metaforicamente este pedaço de papel pelo correio ou dizer a Alice para lê-lo depois de terminar outra tarefa ... Esse é um dos benefícios de usar closures!
*/

let ramon = {
    print("melhor DJ do PicPay!")
}

ramon()

//Cria a função sem efetivamente dar um nome, mas atribui a função à variável ramon

let ramonilho = { (feat: String) in
    print("Ramon anuncia parceria com \(feat)")
}

ramonilho("Barões da pisadinha")

let ramonilhoComRetorno = { (feat: String) -> String in
    return "Ramon anuncia parceria com \(feat)"
}

let message = ramonilhoComRetorno("Barões da pisadinha")
print(message)

// Como dito anteriormente, pelo motivo de closures basicamente serem usadas como strings ou int, isso permite passá-las dentro de funções

// Aqui talvez comece a ficar meio confuso, por isso podemos ir por partes

//Para passar a closure dentro da função, vamos especificar o parâmetro () -> Void. Em outras palavras, isso quer dizer, a função aceita não ter parametros e retornar nada.

let driving = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived")
}

travel(action: driving)

//Se o último parâmetro da sua função for uma closure, o swift permite que se use uma sintaxe especial chamada trailling closure syntax. Ao inves de passar a closure como parâmetro, pode-se passar ela diretamente após as chaves. Ou seja:

travel() {
    print("I'm driving in my car")
}

//Ou assim: (por não ter mais nada como parâmetro)

travel {
    print("I'm driving in my car")
}

/*Aqui closures podem começar a ficar esquisitas de ler

 Uma closure que você passa em uma função também pode receber seus próprios parâmetros
 No lugar do () -> Void, podemos de fato implementar algo
*/

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

//Por enquanto usamos apenas um parâmetro, mas também podemos dizer o tipo de retorno esperado

func travel(action: (String) -> String) {
    print("I'm getting ready to go")
    let description = action("London")
    print(description)
    print("I arrived")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//Há algumas melhorias que podem ser feitas:
//1 - o Swift ainda assume que essa closure é uma string e também que retorna uma string;
//2 - e também como a closure retornará apenas uma linha, pode-se remover o return.
//3 - além disso, podemos usar no lugar do parâmetro, algo que o Swift nos provê:
//Então:

// Caso 1
travel { place in
    return "I'm going to \(place) in my car"
}

// Caso 2 e 3
travel {
    "I'm going to \($0) in my car"
}

//Da mesma forma que se pode passar uma closure para uma função, também podemos obter closures do retorno de uma função

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//A ideia é que um -> especifique o valor do retorno, e o segundo -> especifique o retorno da closure.

let result = travel()
result("London")

//Uma coisa importante aqui: Qualquer valor externo dentro da closure, o Swift captura ele e armazena ele independente da closure, então ele pode ser modificado mesmo que não exista mais

func travel2() -> ((String) -> Void) {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result2 = travel2()
result2("London")
result2("London")
result2("London")


/* NOTAS
 1. Pode-se atribuir closures à variáveis, e chamá-las depois
 2. Closures aceitam parâmetros e retornam valores
 3. Pode-se passar closures dentro de funções como parâmetros, e essa closures também podem ter seus próprios parâmetros e retorno
 4. Se a closure for o último parâmetro da sua função, pode-se usar a "trailling closure syntax"
 5. Se você usar valores externos dentro das suas closures, elas serão armazenadas e a closure pode referenciá-las depois.
 */


// Capture lists
/*
 Ver uma closure como uma função que você pode atribuir a uma variável não faz o conceito de closure a justiça que ele merece. Quando foi explico closure como esse, deixamos de fora uma parte importante: a captura de valores.
Em Swift, uma closure captura variáveis ​​e constantes de seu escopo circundante.
*/
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// Strong references
/* Por padrão, closures são reference types
 Sempre quando você assinalar uma função ou closure para uma constante ou variável, vocês está na verdade fazendo com que a constante ou variável seja uma referência para a função/closure.

 Isto também significa que se você assinalar uma closure para duas constantes ou variáveis diferentes, ambas vão apontar para a mesma closure.
*/

let incrementByTen = makeIncrementer(forIncrement: 10)
let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()
incrementByTen()

// Escaping and non-escaping
/*
Non-escaping: Ao passar uma closure como o argumento da função, a closure é executado com o corpo da função e retorna o compilador. Quando a execução termina, a closure sai do escopo e não tem mais existência na memória.
 1. Passe a closure como argumento de função, durante a chamada de função.
 2. Faça algum trabalho adicional com a função.
 3. A função executa a closure.
 4. A função retorna o compilador de volta.
 */
class DoSomething {
    func getSumOf(array:[Int], handler: ((Int)->Void)) {
        //step 2
        var sum: Int = 0
        for value in array {
            sum += value
        }
        
        //step 3
        handler(sum)
    }
        
    func doSomething() {
        //setp 1
        self.getSumOf(array: [16,756,442,6,23]) { (sum) in
            print(sum)
            //step 4, finishing the execution
        }
    }
}

/* Escaping Closure
 Ao passar uma closure como o argumento da função, a closure está sendo preservado para ser executado mais tarde e o corpo da função é executado, o compilador retorna de volta. Quando a execução termina, o escopo da closure passado existe e tem existência na memória, até que o fechamento seja executado.
 Existem várias maneiras de escapar da closure:
*/

class DoSomething2 {
    var complitionHandler: ((Int)->Void)?
    
    func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
        //step 2
       //here I'm taking for loop just for example, in real case it'll be something else like API call
       var sum: Int = 0
        for value in array {
            sum += value
        }
        //step 3
        self.complitionHandler = handler
    }
    
    func doSomething() {
        //setp 1
        self.getSumOf(array: [16,756,442,6,23]) { [weak self](sum) in
            print(sum)
            //step 4, finishing the execution
        }
    }
//Here we are storing the closure for future use.
//It will print the sumof all the passed numbers.
}


// Retain Cycle
/* Por padrao, quando uma closure captura um valor, ela cria uma referencia forte. Para quebrar o retain cycle, você precisa adicionar uma lista de captura. Funciona parecido como uma propriedade de uma classe que você pode marcá-la como weak, você também pode marcar o valor que foi capturado pela closure como uma referência weak ou unowned. O valor padrão capturado pela closure é strong.
 */


// Implementacao dia a dia?

// Helpers
import Foundation

struct Contact: Decodable {
    let id: String
    let name: String
    let photoURL: String
}

enum NetworkError: LocalizedError {
    case unknown(Error)
    case invalidURL
    case decodeFailure
    case invalidData
}

class Service {
    private let apiURL = "https://run.mocky.io/v3/1d9c3bbe-eb63-4d09-980a-989ad740a9ac"
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchContacts(completion: @escaping (Result<[Contact], NetworkError>) -> Void) {
        guard let api = URL(string: apiURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = session.dataTask(with: api) { (data, response, error) in
            if let error = error {
                completion(.failure(.unknown(error)))
            }
            
            guard let jsonData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Contact].self, from: jsonData)
                
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodeFailure))
            }
        }
        
        task.resume()
    }
}

// 1. Closures escaping and non-escaping
// Por padrão

class TestViewModel {
    private let service: Service
    var isLoading: (Bool) -> Void
    var onError: (String) -> Void
    
    init(service: Service,
         isLoading: @escaping (Bool) -> Void,
         onError: @escaping (String) -> Void) {
        self.service = service
        self.isLoading = isLoading
        self.onError = onError
    }
    
    func getContactsList() {
        isLoading(true)
        service.fetchContacts { result in
            self.isLoading(false)
            switch result {
            case .success(let contacts):
                print(contacts)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// Closures que são opcionais por padrão são escaping, então você não precisa colocar a tag @escaping nela

class TestViewModel2 {
    var isLoading: ((Bool) -> Void)?
    var onError: ((String) -> Void)?
    
    init(isLoading: ((Bool) -> Void)?, onError: ((String) -> Void)?) {
        self.isLoading = isLoading
        self.onError = onError
    }
    
    func getContactsList() {
        isLoading?(true)
    }
}

// Referências
// https://fuckingclosuresyntax.com/
