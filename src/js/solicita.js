document.addEventListener('DOMContentLoaded', function() { // Aguarda o documento ser carregado

    // Seleciona elementos do formulario
    const addItemBtn = document.getElementById('add-item-btn');
    const itemList = document.getElementById('item-list');
    const solicitaForm = document.getElementById('solicita-form');

    let itensDaSolicitacao = []; // Armazena os itens em um array

    // Função para renderizar/atualizar a lista visual
    function renderizarLista(){
        itemList.innerHTML = ''; // Limpa a lista vizual atual

        // Recriando cada item na lista com base no array de dados
        itensDaSolicitacao.forEach((item, index) => {
            const listItem = document.createElement('li');

            // Adiciona o texto do item
            const itemText = document.createElement('span');
            itemText.textContent = `${item.nome} - Quantidade: ${item.qtd}`;
            listItem.appendChild(itemText);

            // Cria o Botão de remoção
            const removebtn = document.createElement('button');
            removebtn.textContent = "Remover";
            removebtn.className = 'remove-item-btn';
            // Armazena o índice no próprio botão para saber qual remover
            removebtn.dataset.index = index;
            listItem.appendChild(removebtn);

            itemList.appendChild(listItem);
        });
    }

    // Função para adicionar um novo item ao clique do botão
    addItemBtn.addEventListener('click', function() {
        const tipoItemInput = document.getElementById('tipo_item');
        const quantidadeInput = document.getElementById('quantidade');

       const nomeItem = tipoItemInput.value.trim();
       const quantidade = parseInt(quantidadeInput.value, 10);

       // Validação para não adicionar itens em branco
       if(nomeItem && quantidade > 0){
        itensDaSolicitacao.push({nome: nomeItem, qtd: quantidade});

       //Cria um novo elemento de lista para mostrar o item
       renderizarLista();

       // Limpa os campos de Input 
       //tipoItemInput.value = '';
       quantidadeInput.value = '1';
       tipoItemInput.focus() // Coloca o foco de volta no campo do item
       }
       else{
        alert("Preencha o nome do componente e a quantidade");
       }
    });

    // Função para remover um item ao clique do botão
    itemList.addEventListener('click', function(event) {
        // Verificar se o elemento clicado foi um botão remover
        if(event.target.classList.contains('remove-item-btn')) {
            const indexParaRemover = parseInt(event.target.dataset.index, 10);

            // Removendo o item do array usando o índice
            itensDaSolicitacao.splice(indexParaRemover, 1);

            // Atualiza a lista na tela
            renderizarLista();
        }
    });

    solicitaForm.addEventListener('submit', function(event){
        event.preventDefault() // Previne o comportamento padrão de recarregar a pagina

        const cpf = document.getElementById('cpf').value;
        const descricao = document.getElementById('descricao').value;
        const dataEntrega = document.getElementById('data_entrega').value;
        
        // Validar para não deixar enviar uma solicitação sem itens
        if(itensDaSolicitacao.length === 0){
            alert("Você precisa adicionar pelo menos um item à solicitação");
            return; //Interrompe o envio
        }

        // Montando o objeto final com todos os itens da solicitação
        const dadosSolicitacao = {
            cpf: cpf,
            descricao: descricao,
            dataEntrega: dataEntrega,
            itens: itensDaSolicitacao
        };

        // Exibe os dados no console do navegador (F12) para teste
        console.log("Dados a serem enviados para o servidor:", dadosSolicitacao);
        alert('Solicitação enviada! (Verifique o console do navegador para ver os dados)');
    });
});