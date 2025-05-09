document.addEventListener('DOMContentLoaded', () => {
    const enterButton = document.getElementById('enter-button');
    const mainContent = document.getElementById('main-content');
    const spinnerContainer = document.getElementById('spinner-container');
    const flutterFlowUrl = 'https://app.dietafacil.fit'; // URL real do app

    // 1. Pré-carrega o FlutterFlow em segundo plano (iframe oculto)
    const preloadIframe = document.createElement('iframe');
    preloadIframe.src = flutterFlowUrl;
    preloadIframe.style.display = 'none';
    document.body.appendChild(preloadIframe);

    // 2. Configura o clique no botão ENTRAR
    enterButton.addEventListener('click', () => {
        // Mostra o spinner e esconde o conteúdo inicial
        mainContent.style.display = 'none';
        spinnerContainer.style.display = 'flex';

        // 3. Redireciona para o FlutterFlow após 300ms (tempo para ver o spinner)
        setTimeout(() => {
            window.location.href = flutterFlowUrl;
        }, 300);
    });

    // (Opcional) Monitora o pré-carregamento
    preloadIframe.onload = () => {
        console.log('App FlutterFlow pré-carregado!');
    };
});
