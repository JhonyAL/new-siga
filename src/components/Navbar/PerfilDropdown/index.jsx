import Link from 'next/link'

export default function PerfilDropdown({ perfil }) {
  const more = [
    {
      title: "Sobre o aluno",
      list: ["Perfl", "Geral", "Ficha de Desempenho"],
    },
  ];

  return (
    <div className="absolute shadow rounded-lg top-12 right-0 my-5 bg-white w-64">
      <div className="px-4 py-3 text-sm text-gray-900 dark:text-white text-xs flex flex-col">
        <span className='font-medium text-sm'>{perfil.NOME}</span>
        <span className='px-2'>RA: {perfil.RA}</span>
        <span className='px-2'>RM: {perfil.RM}</span>
      </div>
      <hr />
      <ul
        className="py-2 text-sm text-gray-700 dark:text-gray-200"
      >
        <li>
          <Link
            href="/"
            className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
          >
            Perfl
          </Link>
        </li>
        <li>
          <Link
            href="/"
            className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
          >
            Geral
          </Link>
        </li>
        <li>
          <Link
            href="/"
            className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
          >
            Ficha de Desempenho
          </Link>
        </li>
      </ul>
      <hr />
      <div 
        className="px-4 py-3 text-sm text-gray-900 dark:text-white hover:bg-gray-100 dark:hover:bg-gray-600 cursor-pointer"
        onClick={() => {
            localStorage.removeItem('user')
            location.reload()
        }}
    >
        <span>Sair</span>
      </div>
      
    </div>
  );
}
