using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class SituacaoRepositoy
    {
        MedicalGroupContext ctx = new MedicalGroupContext();

        public void AtualizarUrl(int idSituacao, Situacao SituacaoAtualizada)
        {
            throw new NotImplementedException();
        }

        public Situacao BuscarPorId(int idSituacao)
        {
            return ctx.Situacaos.FirstOrDefault(u => u.IdSituacao == idSituacao);
        }

        public void Cadastrar(Situacao novaSituacao)
        {
            ctx.Situacaos.Add(novaSituacao);

            ctx.SaveChanges();
        }

        public void Deletar(int idSituacao)
        {
            ctx.Situacaos.Remove(BuscarPorId(idSituacao));

            ctx.SaveChanges();
        }

        public List<Situacao> ListarTodos()
        {
            return ctx.Situacaos.ToList();
        }
    }
}
