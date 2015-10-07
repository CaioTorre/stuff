class Product
    @id = 0
    @pName = ""
    @img = ""
    @quantity = 0
    def initialize(id, nm, im, qt)
        @id = id
        @pName = nm
        @img = im
        @quantity = qt
    end
    def get_qt
        return @quantity
    end
    def get_im
        return @img
    end
    def get_nm
        return @pName
        #print "returning name " + @pName
    end
    def get_id
        return @id
    end
    def set_qt qt
         
        @quantity = qt
        @quantity = 0 if @quantity < 0
    end
    def add_qt qt
    #puts "Adding " + qt.to_s + " to " + @quantity.to_s + @pName
        @quantity += qt
        @quantity = 0 if @quantity < 0
    end
    def rem_qt qt
    #puts "Adding " + qt.to_s + " to " + @quantity.to_s + @pName
        @quantity -= qt
        @quantity = 0 if @quantity < 0
    end
end

def split(rcv, char)
	splitted = Array.new((rcv.count(char)), "")
	#puts "Length = " + (rcv.count(char) + 1).to_s
	curr = ""
	i = 0
	rcv.each_byte { |x|
		ana = x.chr
		if ana == char
			splitted[i] = curr
			i += 1
			curr = ""
		else
			curr << ana
		end
		#puts ana
		#puts i.to_s
		#puts
		#puts splitted.join(" ")
		#print splitted
		#puts
		#puts
	}
	#splitted[i + 1] = curr
	return splitted << curr
end

def prompt(dict, lis)
    tryAgain = true
    while tryAgain
        print "Utilizar ID (1) ou Nome (2)? "
        use = gets.to_i
        if use == 1
            print "ID: "
            ans = gets.to_i
            if lis.has_key?(ans)
                return lis[ans]
                tryAgain = false
            else
                puts "ID nao foi encontrado..."
                print "Tentar novamente? (s/n) "
                tryAgain = gets.chomp.to_s == "s"
                puts
            end
        else
            print "Nome: "
            nam = gets.chomp.to_s
            if dict.has_key?(nam)
                return lis[dict[nam]]
                tryAgain = false
            else
                puts "Nome nao foi encontrado..."
                print "Tentar novamente? (s/n) "
                tryAgain = gets.chomp.to_s == "s"
                puts
            end
        end
    end
    return 0
end

puts "Produtos"
puts
apple = Product.new(1, "apple", "---", 5)
mango = Product.new(2, "mango", "---", 7)
products = {apple.get_id => apple, mango.get_id => mango}
fileLoc = "stock.txt"
dict = {}
while true
    ###
    products = {}
   	IO.foreach(fileLoc) { |b| 
    	currReadArr = split(b, " ")
        products.store(currReadArr[0].to_i, (Product.new(currReadArr[0].to_i, currReadArr[1], currReadArr[2], currReadArr[3].to_i)))
    }
    ###
    #Obter lista do txt e converter em hash, key = id, value = Product
    dict = {}
    products.each_value { |v| 
        dict.store(v.get_nm, v.get_id)
    }
    print "Comando: " 
    cmd = gets.chomp.to_s.downcase
    case cmd
    	when "comandos", "ajuda"
        	puts "Lista, AdicionarP, RemoverP, Quantidade, AdidionarQ, RemoverQ, DefinirQ"
    	when "lista", "l", "listar", "p", "produtos"
                products.each_value {|p| puts p.get_nm + " (ID: " + p.get_id.to_s + ")" }
            when "removerp", "rp", "remover p", "remover produto"
                prod = prompt(dict, products)
                if prod != 0
                        puts "Produto encontrado: " + products[prod.get_id].get_nm
                        puts "Quantidade do produto: " + products[prod.get_id].get_qt.to_s
                        puts "Removendo produto..."
                        products.delete(prod.get_id)
                end
            when "removerq", "rq", "remover q", "remover quantidade", "remover quantia"
                prod = prompt(dict, products)
                if prod != 0
                    puts "Produto encontrado: " + products[prod.get_id].get_nm
                    puts "Quantidade do produto: " + products[prod.get_id].get_qt.to_s
                    print "Remover valor: "
                    val = gets.to_i
                    products[prod.get_id].rem_qt(val)
                end
            when "adicionarp", "ap", "adicionar produto"
                tryAgain = true
                while tryAgain
                    print "Nome do produto: "
                    nam = gets.chomp.to_s
                    if !(dict.has_key?(nam))
                        print "ID do produto: "
                        id = gets.to_i
                        if !(products.has_key?(id))
                            print "Imagem do produto: "
                            img = gets.chomp.to_s
                            print "Quantidade do produto: "
                            qt = gets.to_i
                            products.store(id, Product.new(id, nam, img, qt))
                            tryAgain = false
                        else
                            puts "ID " + id.to_s + " ja esta em uso (produto " + products[id].get_nm + ")"
                            print "Deseja tentar novamente? (s/n) "
                            tryAgain = (gets.chomp.to_s.downcase == "s")
                            puts
                        end
                    else
                        puts "Nome " + nam.to_s + " ja esta em uso"
                        print "Deseja tentar novamente? (s/n) "
                        tryAgain = (gets.chomp.to_s.downcase == "s")
                        puts
                    end
                end
            when "quantidade", "quantia", "q"
                prod = prompt(dict, products)
                if prod != 0
                    puts "Produto encontrado: " + products[prod.get_id].get_nm
                    puts "Quantidade do produto: " + products[prod.get_id].get_qt.to_s
                end
            when "adicionarq", "aq", "adicionar q", "adicionar quantidade", "adicionar quantia"
                prod = prompt(dict, products)
                if prod != 0
                    puts "Produto encontrado: " + products[prod.get_id].get_nm
                    puts "Quantidade do produto: " + products[prod.get_id].get_qt.to_s 
                    print "Adicionar valor: "
                    val = gets.to_i
                    products[prod.get_id].add_qt(val)
                end
            when "definirq", "dq", "definir q", "definir quantidade", "definir quantia"
                prod = prompt(dict, products)
                if prod != 0
                    puts "Produto encontrado: " + products[prod.get_id].get_nm
                    puts "Quantidade do produto: " + products[prod.get_id].get_qt.to_s
                    print "Novo valor: "
                    val = gets.to_i
                    products[prod.get_id].set_qt(val)
                end
			else
				puts "Unknown command (" + cmd.to_s.chomp + ")"
            end
        #Apagar txt e repor os arquivos a partir da hash products
        #Clear fileLoc somehow!!!
		###
		##file.truncate(0)
		file = File.open(fileLoc, "w")
        products.each_value { |v| 
            file.syswrite(v.get_id.to_s + " " + v.get_nm + " " + v.get_im + " " + v.get_qt.to_s + "\n")
        }
		file.close
		###
        puts "--//--"
        puts
end
