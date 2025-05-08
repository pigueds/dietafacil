document.addEventListener('DOMContentLoaded', () => {
    const enterButton = document.getElementById('enter-button');
    const mainContent = document.getElementById('main-content');
    const spinnerContainer = document.getElementById('spinner-container');
    const userFacingUrl = 'https://dietafacil.fit'; // URL que o usuário vê
    const flutterFlowUrl = 'https://dietafacil.flutterflow.app'; // URL real do app

    // Pré-carrega TODOS os recursos do FlutterFlow
    function preloadApp() {
        // 1. Pré-conecta aos domínios do FlutterFlow e dependências
        const criticalDomains = [
            flutterFlowUrl,
            'https://www.gstatic.com',
            'https://fonts.googleapis.com',
            'https://fonts.gstatic.com'
        ];
        
        criticalDomains.forEach(domain => {
            const link = document.createElement('link');
            link.rel = 'preconnect';
            link.href = domain;
            link.crossOrigin = 'anonymous';
            document.head.appendChild(link);
        });

        // 2. Pré-carrega os recursos específicos do FlutterFlow
        const flutterResources = [
            '/main.dart.js',
            '/assets/fonts/MaterialIcons-Regular.otf',
            '/assets/splash/splash.js',
            '/manifest.json'
        ];

        flutterResources.forEach(resource => {
            const link = document.createElement('link');
            link.rel = 'preload';
            link.href = `${flutterFlowUrl}${resource}`;
            link.as = resource.endsWith('.js') ? 'script' : 
                      resource.endsWith('.otf') ? 'font' : 'fetch';
            link.crossOrigin = 'anonymous';
            document.head.appendChild(link);
        });

        // 3. Iframe oculto com a URL REAL do FlutterFlow (mais eficaz)
        const iframe = document.createElement('iframe');
        iframe.src = flutterFlowUrl;
        iframe.style.display = 'none';
        document.body.appendChild(iframe);
    }

    // Inicia o pré-carregamento
    preloadApp();

    // Controle do botão ENTRAR
    if (enterButton && mainContent && spinnerContainer) {
        enterButton.addEventListener('click', () => {
            mainContent.style.display = 'none';
            spinnerContainer.style.display = 'flex';
            
            // Redireciona para a URL "limpa" (dietafacil.fit)
            setTimeout(() => {
                window.location.href = userFacingUrl;
            }, 150);
        });
    }
});
