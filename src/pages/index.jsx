import { useEffect, useState } from 'react'

export default function Home() {

  useEffect(() => {document.title = "Página Inicial"}, [])

  return (
    <h1>Página HOME</h1>
  )
}
