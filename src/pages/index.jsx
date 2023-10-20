import Image from 'next/image'
import '../app/globals.css'
import { Navbar } from '../components'
import Layout from '@/components/layout'
import logo from '../assets/logo.png'
import { useEffect, useState } from 'react'

export default function Home() {
  const [session, setSession] = useState(null)

  const handleSubmitForm = (e) => {
    e.preventDefault()
    const rm = document.querySelector('#textRM').value
    const password = document.querySelector('#password').value
    const options = {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: `{"estudanteRM":"${rm}","estudantePassword":"${password}"}`
    };
    
    fetch('http://localhost:3001/', options)
      .then(response => response.json())
      .then(response => {
        // setUserData(response)
        console.log(response)
        if(document.querySelector("#remember").checked){
          localStorage.setItem('user', JSON.stringify(response))
        }
        setSession(JSON.stringify(response))
      })
      .catch(err => console.error(err));
  }

  useEffect(() => {
    setSession(localStorage.getItem('user') ?? null)
  }, [])

  return (
    session ? 
    <Layout sessionUser={session}>
      <h1>ACERVO SITE</h1>
    </Layout>
    :      
    <section className="bg-gray-50 dark:bg-gray-900">
      <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
          <a href="#" className="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
              <img className="w-8 h-8 mr-2" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg" alt="logo" />
              Acervo    
          </a>
          <div className="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
              <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
                  <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                      Acesse sua conta
                  </h1>
                  <form className="space-y-4 md:space-y-6">
                      <div>
                          <label htmlFor="textRM" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">RM</label>
                          <input type="text" name="textRM" id="textRM" className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                      </div>
                      <div>
                          <label htmlFor="password" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Senha</label>
                          <input type="password" name="password" id="password" className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
                      </div>
                      <div className="flex items-center justify-between">
                          <div className="flex items-start">
                              <div className="flex items-center h-5">
                                <input id="remember" aria-describedby="remember" type="checkbox" className="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800" required="" />
                              </div>
                              <div className="ml-3 text-sm">
                                <label htmlFor="remember" className="text-gray-500 dark:text-gray-300">Se lembre de mim</label>
                              </div>
                          </div>
                          <a href="#" className="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Esqueceu sua senha?</a>
                      </div>
                      <button type="submit" onClick={handleSubmitForm} className="w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Acessar</button>
                  </form>
              </div>
          </div>
      </div>
    </section>
  )
}
