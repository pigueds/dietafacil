document.addEventListener('DOMContentLoaded', () => {
    const enterButton = document.getElementById('enter-button');
    const mainContent = document.getElementById('main-content');
    const spinnerContainer = document.getElementById('spinner-container');
    const flutterFlowUrl = 'https://app.dietafacil.fit'; // URL do app FlutterFlow

    // 1. Pré-carrega o FlutterFlow em segundo plano (iframe oculto)
    const preloadIframe = document.createElement('iframe');
    preloadIframe.src = flutterFlowUrl;
    preloadIframe.style.cssText = 'display: none; width: 0; height: 0; border: none;';
    preloadIframe.setAttribute('title', 'Pré-carregamento FlutterFlow');
    document.body.appendChild(preloadIframe);

    // 2. Configura o clique no botão ENTRAR
    enterButton.addEventListener('click', () => {
        // Mostra o spinner e esconde o conteúdo inicial
        mainContent.style.display = 'none';
        spinnerContainer.style.display = 'flex';

        // 3. Redireciona para o FlutterFlow após um delay mínimo
        setTimeout(() => {
            window.location.href = flutterFlowUrl;
        }, 300); // Delay para garantir que o spinner seja visto
    });

    // (Opcional) Verifica se o iframe foi carregado
    preloadIframe.onload = () => {
        console.log('App FlutterFlow pré-carregado com sucesso!');
        // Se quiser, pode esconder o spinner aqui ou otimizar algo
    };
});
