import Image from 'next/image'
import Link from 'next/link'
import Logo from './../../assets/Acervo_Logo.png'

export const Navbar = ({ foto }) => {

  return (

<div class="flex flex-wrap place-items-center h-screen ">
  <section class="absolute top-0 right-0">
    <nav class="flex justify-between bg-white  w-screen">
      <div class="px-5 xl:px-12 py-6 flex w-full items-center">
        <Link class="text-3xl font-bold font-heading" href="#">
          <Image class="h-8 w-12" src={Logo} alt="logo" />
        </Link>
        <ul class="hidden md:flex px-4 mx-auto font-semibold font-heading space-x-12">
          <li><Link class="hover:text-gray-200" href="#">Home</Link></li>
          <li><Link class="hover:text-gray-200" href="#">Catagory</Link></li>
          <li><Link class="hover:text-gray-200" href="#">Collections</Link></li>
          <li><Link class="hover:text-gray-200" href="#">Contact Us</Link></li>
        </ul>
        <div class="hidden xl:flex items-center space-x-5 items-center">
          <Link class="flex items-center hover:text-gray-200" href="#">
              <Image src={foto} alt="Foto de perfil" class="h-9 w-9 hover:text-gray-200 rounded-full" width="50" height="50" />
          </Link>
        </div>
      </div>
      <Link class="xl:hidden flex mr-6 items-center" href="#">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg>
        <span class="flex absolute -mt-5 ml-4">
          <span class="animate-ping absolute inline-flex h-3 w-3 rounded-full bg-pink-400 opacity-75"></span>
          <span class="relative inline-flex rounded-full h-3 w-3 bg-pink-500">
          </span>
        </span>
      </Link>
      <Link class="navbar-burger self-center mr-12 xl:hidden" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
      </Link>
    </nav>
    
  </section>
</div>
  );
};

