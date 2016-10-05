if ('serviceWorker' in navigator) {
    console.log('Service Worker is supported');
    navigator.serviceWorker.register('/serviceworker.js')
        .then(function(registration) {
            console.log('Successfully registered!', ':^)', registration);
            registration.pushManager.subscribe({ userVisibleOnly: true })
                .then(function(subscription) {
                    $.post("/notification/subscribe", { subscription: subscription.toJSON() });
                });
        }).catch(function(error) {
        console.log('Registration failed', ':^(', error);
    });
}