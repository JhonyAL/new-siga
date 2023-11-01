import Image from 'next/image'
import Link from 'next/link'
import Logo from './../../assets/Acervo_Logo.png'
import { useState } from 'react';
import PerfilDropdown from './PerfilDropdown';

export const Navbar = ({ perfil }) => {

  const [perfilDropdown, setPerfilDropdown] = useState(false)

  return (
    <nav className='flex justify-between bg-white w-screen absolute top-0 right-0 px-8'>
      <div className='py-4 items-center '>
        <Link href="/" className='flex flex-row space-x-4'>
          <Image className="h-8 w-12" src={Logo} alt="logo" />
          <h3 className='font-medium text-xl'>Acervo</h3>
        </Link>
      </div>
      <div>
        <ul className="flex items-center py-4 font-semibold space-x-12">
          <li><Link className="hover:text-cyan-700" href="/">Página Inicial</Link></li>
          <li><Link className="hover:text-cyan-700" href="/">Notícias</Link></li>
          <li><Link className="hover:text-cyan-700" href="/">Agenda</Link></li>
        </ul>
      </div>
      <div className="flex items-center relative">
        <div className="flex items-center space-x-4 cursor-pointer" onClick={() => setPerfilDropdown(!perfilDropdown)}>
          <Image src={perfil.FOTO}  alt="Foto de perfil" className="h-9 w-9 rounded-full" width="60" height="50" />
          <p className='font-semibold'>{perfil.NOME}</p>
        </div>
        {perfilDropdown ? <PerfilDropdown perfil={perfil}/> : <></>}
      </div>
    </nav>
  
  )


{/* <div className="flex flex-wrap place-items-center h-screen ">
  <section className="absolute top-0 right-0">
    <nav className="flex justify-between bg-white  w-screen">
      <div className="px-5 xl:px-12 py-6 flex w-full items-center">
        <Link className="text-3xl font-bold font-heading" href="#">
          <Image className="h-8 w-12" src={Logo} alt="logo" />
        </Link>
        <ul className="hidden md:flex px-4 mx-auto font-semibold font-heading space-x-12">
          <li><Link className="hover:text-gray-200" href="#">Home</Link></li>
          <li><Link className="hover:text-gray-200" href="#">Catagory</Link></li>
          <li><Link className="hover:text-gray-200" href="#">Collections</Link></li>
          <li><Link className="hover:text-gray-200" href="#">Contact Us</Link></li>
        </ul>
        <div className="hidden xl:flex items-center space-x-5 items-center">
          <div className="flex items-center hover:text-gray-200" href="#">
            <Image src={foto} onClick={() => console.log("OKAY")} alt="Foto de perfil" className="h-9 w-9 hover:text-gray-200 rounded-full" width="50" height="50" />
              
              {
                perfil ? <></> :

              <div id="dropdownInformation" className="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                  <div className="px-4 py-3 text-sm text-gray-900 dark:text-white">
                    <div>Bonnie Green</div>
                    <div className="font-medium truncate">name@flowbite.com</div>
                  </div>
                  <ul className="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformationButton">
                    <li>
                      <a href="#" className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a>
                    </li>
                    <li>
                      <a href="#" className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                    </li>
                    <li>
                      <a href="#" className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                    </li>
                  </ul>
                  <div className="py-2">
                    <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Sign out</a>
                  </div>
              </div>
              }
          </div>
        </div>
      </div>
      <Link className="xl:hidden flex mr-6 items-center" href="#">
        <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 hover:text-gray-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg>
        <span className="flex absolute -mt-5 ml-4">
          <span className="animate-ping absolute inline-flex h-3 w-3 rounded-full bg-pink-400 opacity-75"></span>
          <span className="relative inline-flex rounded-full h-3 w-3 bg-pink-500">
          </span>
        </span>
      </Link>
      <Link className="navbar-burger self-center mr-12 xl:hidden" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 hover:text-gray-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
      </Link>
    </nav>
    
  </section>
</div> */}
};

