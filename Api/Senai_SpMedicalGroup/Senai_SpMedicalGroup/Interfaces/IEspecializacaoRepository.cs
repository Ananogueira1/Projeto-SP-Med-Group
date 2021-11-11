using Senai_SpMedicalGroup.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Interfaces
{
    interface IEspecializacaoRepository
    {
        /// <summary>
        /// Lista todos as Especialidades
        /// </summary>
        /// <returns></returns>
        List<Especializacao> ListarTodos();

        /// <summary>
        /// Busca uma Especialidade através do id
        /// </summary>
        /// <param name="idEspecialidade">Id da Especialidade a ser buscada</param>
        /// <returns></returns>
        Especializacao BuscarPorId(int idEspecialidade);

        /// <summary>
        /// Cadastra uma nova Especialidade
        /// </summary>
        /// <param name="novaEspecialidade">Objeto Especialidade a ser cadastrado</param>
        void Cadastrar(Especializacao novaEspecialidade);

        /// <summary>
        /// Deleta uma Especialidade através do id
        /// </summary>
        /// <param name="idEspecialidade">Id da Especialidade a ser deletada</param>
        void Deletar(int idEspecialidade);

        /// <summary>
        /// Atualiza uma Especialidade através do id
        /// </summary>
        /// <param name="idEspecialidade">Id da Especialidade a ser atualizada</param>
        /// <param name="EspecialidadeAtualizada">Objeto Especialidade a ser atualizado</param>
        void AtualizarUrl(int idEspecialidade, Especializacao EspecialidadeAtualizada);
    }
}
