using Senai_SpMedicalGroup.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Interfaces
{
    interface ITipoUsuarioRepository
    {
        /// <summary>
        /// Lista todos os TiposUsuarios
        /// </summary>
        /// <returns></returns>
        List<TipoUsuario> ListarTodos();

        /// <summary>
        /// Busca um TipoUsuario através do id
        /// </summary>
        /// <param name="idTipoUsuario">Id do TipoUsuario a ser buscado</param>
        /// <returns></returns>
        TipoUsuario BuscarPorId(int idTipoUsuario);

        /// <summary>
        /// Cadastra um novo TipoUsuario
        /// </summary>
        /// <param name="novoTipoUsuario">Objeto TipoUsuario a ser cadastrado</param>
        void Cadastrar(int idTipoUsuario, TipoUsuario novoTipoUsuario); 

        /// <summary>
        /// Deleta um TipoUsuario através do id
        /// </summary>
        /// <param name="idTipoUsuario">Id tipo usuario a ser deletado</param>
        void Deletar(int idTipoUsuario);

        /// <summary>
        /// Atualiza um TipoUsuario através do id
        /// </summary>
        /// <param name="idTipoUsuario">Id do TipoUsuario a ser atualizado</param>
        /// <param name="tipoUsuarioAtualizado">Objeto TipoUsuario a ser atualizado</param>
        void AtualizarUrl(int idTipoUsuario, TipoUsuario tipoUsuarioAtualizado);
    }
}
