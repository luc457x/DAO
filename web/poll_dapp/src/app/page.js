"use client"

import Head from "next/head";

//TODO: Make css more responsive.  

export default function Home() {
  
  function btnLoginClick(){
    console.log("click")
  }

  return (
    <>
      <Head>
        <title>Poll Dapp | Login</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <div className="container col-xxl-8 px-2 py-2 text-white">
        <div className="row flex-lg-row-reverse align-itens-center g-2 py-2 g-lg-3">
          <div className="col-12 col-sm-8 col-lg-6">
            <img src="/imgs/daoVoting.jpg" className="d-block mx-lg-auto img-fluid" />
          </div>
          <div className="col-12 col-sm-8 col-lg-6">
            <div className="d-grid gap-2 mb-4 d-md-flex flex-md-column justify-content-md-start">
              <h1 className="display-5 fw-bold lh-1 mb-5">DAO voting system</h1>
              <p className="lead">Create polls and cast votes on chain!</p>
              <p className="lead">You can easily create polls that are auditable, with all the security and transparency that a blockchain can provide.</p>
              <p className="lead">Another advantage of using blockchains to create voting polls is the immutability of data, which ensures that once a vote is cast, it cannot be altered or tampered with.</p>
            </div>
            <div className="d-grid gap-2 d-md-flex flex-md-column justify-content-md-start">
              <p className="lead mb-2">Authenticate with your metamask wallet:</p>
              <button type="button" onClick={btnLoginClick} className="hover-button btn-primary bg-primary btn-lg fw-bold fs-4 px-4 me-md-2">
                <img src="/imgs/metamask.svg" width={64} className="me-3" />
                Connect with metamask
              </button>
            </div>
          </div>
        </div>
        <footer className="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          <p className="col-md-4 mb-0 text-info">&copy; 2024 | lucas7x</p>
          <ul className="nav col-md-4 justify-content-end">
            <li className="nav-item"><a href="/" className="nav-link px-2 text-info">Home</a></li>
            <li className="nav-item"><a href="https://lucas7x.win" className="nav-link px-2 text-info">About</a></li>
          </ul>
        </footer>
      </div>
    </>
  );
}
