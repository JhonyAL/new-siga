import Image from 'next/image'
import Link from 'next/link'
import Logo from './../../assets/Acervo_Logo.png'
import { useState } from 'react';
import PerfilDropdown from './PerfilDropdown';

export const Navbar = ({ perfil }) => {

  const [perfilDropdown, setPerfilDropdown] = useState(false)

  return (
    <nav className='flex justify-between bg-white w-screen absolute top-0 right-0 px-8' id="navbar">
      <div className='py-4 items-center '>
        <Link href="/" className='flex flex-row space-x-4'>
          <Image className="h-8 w-11 object-cover" src={Logo} alt="logo" />
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
          <Image src={perfil.FOTO}  alt="Foto de perfil" className="h-9 w-9 rounded-full object-cover" width="60" height="50" />
          <p className='font-semibold'>{perfil.NOME}</p>
        </div>
        {perfilDropdown ? <PerfilDropdown perfil={perfil}/> : <></>}
      </div>
    </nav>
  )
};

