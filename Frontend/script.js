document.addEventListener('DOMContentLoaded', () => {
    const API_BASE_URL = 'https://localhost:7155/api/Fipe';

    const tipoSelect = document.getElementById('tipo');
    const marcaSelect = document.getElementById('marca');
    const modeloSelect = document.getElementById('modelo');
    const anoSelect = document.getElementById('ano');
    const loader = document.getElementById('loader');
    const resultadoDiv = document.getElementById('resultado');

    function showLoader(show) {
        loader.classList.toggle('hidden', !show);
    }

    function resetSelect(select, defaultText) {
        select.innerHTML = `<option value="">${defaultText}</option>`;
        select.disabled = true;
    }

    async function fetchData(endpoint) {
        try {
            showLoader(true);
            const response = await fetch(`${API_BASE_URL}/${endpoint}`);
            if (!response.ok) {
                throw new Error(`Erro na requisição: ${response.statusText}`);
            }
            return await response.json();
        } catch (error) {
            console.error('Falha ao buscar dados:', error);
            alert('Não foi possível carregar os dados. Verifique o console para mais detalhes.');
        } finally {
            showLoader(false);
        }
    }

    function populateSelect(select, items, valueField = 'codigo', textField = 'nome') {
        if (!items || items.length === 0) return;
        items.forEach(item => {
            const option = document.createElement('option');
            option.value = item[valueField];
            option.textContent = item[textField];
            select.appendChild(option);
        });
        select.disabled = false;
    }

    tipoSelect.addEventListener('change', async () => {
        resetSelect(marcaSelect, 'Aguardando tipo...');
        resetSelect(modeloSelect, 'Aguardando marca...');
        resetSelect(anoSelect, 'Aguardando modelo...');
        resultadoDiv.classList.add('hidden');

        const tipo = tipoSelect.value;
        if (!tipo) return;

        const marcas = await fetchData(`marcas/${tipo}`);
        populateSelect(marcaSelect, marcas);
    });
    
    marcaSelect.addEventListener('change', async () => {
        resetSelect(modeloSelect, 'Aguardando marca...');
        resetSelect(anoSelect, 'Aguardando modelo...');
        resultadoDiv.classList.add('hidden');
        
        const tipo = tipoSelect.value;
        const marca = marcaSelect.value;
        if (!marca) return;
        
        const modelos = await fetchData(`modelos/${tipo}/${marca}`);
        populateSelect(modeloSelect, modelos);
    });

    modeloSelect.addEventListener('change', async () => {
        resetSelect(anoSelect, 'Aguardando modelo...');
        resultadoDiv.classList.add('hidden');

        const tipo = tipoSelect.value;
        const marca = marcaSelect.value;
        const modelo = modeloSelect.value;
        if (!modelo) return;

        const anos = await fetchData(`anos/${tipo}/${marca}/${modelo}`);
        populateSelect(anoSelect, anos);
    });

    anoSelect.addEventListener('change', async () => {
        resultadoDiv.classList.add('hidden');
        
        const tipo = tipoSelect.value;
        const codigoFipe = anoSelect.value.split('-')[0]; 
        
        if (!codigoFipe) return;

        const veiculo = await fetchData(`valor/${tipo}/${codigoFipe}`); 

        if (veiculo) {
            resultadoDiv.innerHTML = `
                <h2>${veiculo.Marca} ${veiculo.Modelo}</h2>
                <p><strong>Ano Modelo:</strong> ${veiculo.AnoModelo}</p>
                <p><strong>Combustível:</strong> ${veiculo.Combustivel}</p>
                <p><strong>Código FIPE:</strong> ${veiculo.CodigoFipe}</p>
                <p class="valor">Valor: ${veiculo.Valor}</p>
            `;
            resultadoDiv.classList.remove('hidden');
        }
    });
});