//
//  AppDelegate.swift
//  beluga
//
//  Created by Antonio Marcos on 29/06/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data mocked data 
    //mokar dados
    static let ListaDeFornecedores = [
        [
            "nome": "Calce Bem",
            "nicho": "Calçados",
            "imagem": "Calce Bem",
            "endereco": "Rua das Flores, 123 - Centro, São Paulo - SP, CEP 01000-000",
            "telefone": "(11) 91234-5678",
            "sobre": "Conheça a Calce bem sua fornecedora de calçados de qualidade. Com um catálogo abrangente, oferecemos uma ampla seleçãode sapatos para todas as ocasiões. \nTrabalhamos com marcas renomadas, paragarantir conforto e estilo em cada par. \nConte conosco para ter os melhores \nprodutos para sua loja ou negócio.",
            "estrelas": "Estrela5"
        ],
        [
            "nome": "Valentino Carnes",
            "nicho": "Alimentos",
            "imagem": "Valentino Carnes",
            "endereco": "Avenida Beira-Mar, 456 - Praia de Iracema, Fortaleza - CE, CEP 60000-000",
            "telefone": "(11) 992345-6789",
            "sobre": "Seu fornecedor confiável de carnes de \nqualidade. Especializados em oferecer \ncortes suculentos e frescos, fornecemos \ngrande variedade de opções para atender \nàs suas necessidades gastronômicas. \nNossos produtos são cuidadosamente \nselecionados garantindo sabor e qualidadeCexcepcionais. Conte com a Valentino \nCarnes para fornecer as melhores carnes \npara o seu estabelecimento ou negócio, \ncom entrega pontual e um serviço \nimpecável.",
            "estrelas": "Estrela5"
        ],
        [
            "nome": "Borcelle",
            "nicho": "Alimentos",
            "imagem": "Borcelle",
            "endereco": "Travessa do Sol, 789 - Jardim Botânico, Curitiba - PR, CEP 80000-000",
            "telefone": "(91) 3456-7890",
            "sobre": "",
            "estrelas": "Estrela5"
        ],
        [
            "nome": "Lira & Cia",
            "nicho": "Alimentos",
            "imagem": "Lira e cia",
            "endereco": "Rua dos Pássaros, 321 - Jardim das Acácias, Belo Horizonte - MG, CEP 30000-000",
            "telefone": "(11) 94567-8901",
            "sobre": "",
            "estrelas": "Estrela5"
        ],
        [
            "nome": "Aurora",
            "nicho": "Semijóias",
            "imagem": "Aurora",
            "endereco": "Avenida da Liberdade, 987 - Copacabana, Rio de Janeiro - RJ, CEP 20000-000",
            "telefone": "(19) 95678-9012",
            "sobre": "",
            "estrelas": "Estrela5"
        ],
        [
            "nome": "Lobo Sneakers",
            "nicho": "Calçados",
            "imagem": "Lobo",
            "endereco": "Rua das Palmeiras, 654 - Setor Bueno, Goiânia - GO, CEP 70000-000",
            "telefone": "(19) 96789-0123",
            "sobre": "",
            "estrelas": "Estrela4"
        ],
        [
            "nome": "Bijou",
            "nicho": "Semijóias",
            "imagem": "Bijou",
            "endereco": "Travessa das Violetas, 321 - Vila Nova, Porto Alegre - RS, CEP 90000-000",
            "telefone": "(19) 97890-1234",
            "sobre": "",
            "estrelas": "Estrela4"
        ],
        [
            "nome": "Albuquerque Eletrônicos",
            "nicho": "Eletrônicos",
            "imagem": "Albuquerque",
            "endereco": "Avenida Central, 987 - Centro, Brasília - DF, CEP 70000-000",
            "telefone": "(19) 98901-2345",
            "sobre": "",
            "estrelas": "Estrela4"
        ],
        [
            "nome": "Mundo da Computação",
            "nicho": "Eletrônicos",
            "imagem": "Mundo da Computação",
            "endereco": "Rua dos Ipês, 654 - Jardim das Flores, Salvador - BA, CEP 40000-000",
            "telefone": "(19) 99012-3456",
            "sobre": "",
            "estrelas": "Estrela4"
        ],
        [
            "nome": "Estela Duarte",
            "nicho": "Roupas",
            "imagem": "Estela",
            "endereco": "Praça da República, 321 - Centro, Recife - PE, CEP 50000-000",
            "telefone": "(67) 90123-4567",
            "sobre": "",
            "estrelas": "Estrela4"
        ]
    ]

    // MARK: - Core Data stack
      lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BelugaData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            /*
             Typical reasons for an error here include:
             * The parent directory does not exist, cannot be created, or disallows writing.
             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
             * The device is out of space.
             * The store could not be migrated to the current model version.
             Check the error message to determine what the actual problem was.
             */
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        })
//        let viewContext = container.viewContext
//          for fornecedor in AppDelegate.ListaDeFornecedores {
//              let novoFornecedor = Fornecedor(context: viewContext)
//              novoFornecedor.nome = fornecedor["nome"]
//              novoFornecedor.nicho = fornecedor["nicho"]
//              novoFornecedor.imagem = fornecedor["imagem"]
//              saveContext()
//          }
        return container
      }()
    
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
      // MARK: - Core Data Saving support
      func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
          do {
            try context.save()
          } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
        }
      }

}

