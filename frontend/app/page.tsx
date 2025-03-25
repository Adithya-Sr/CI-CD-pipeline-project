import React from "react";

async function Page() {
  const serverAddr = "http://backend:8080/healthCheck";
  let serverStatus = "Server down";

  try {
    const res = await fetch(serverAddr);
    serverStatus = res.ok ? "Server response OK" : "Server response NOT OK";
  } catch (e) {
    serverStatus = "Server down";
  }

  return (
    <div>
      <h1>Sample Frontend</h1>
      <p>Server Status: {serverStatus}</p>
    </div>
  );
}

export default Page;
