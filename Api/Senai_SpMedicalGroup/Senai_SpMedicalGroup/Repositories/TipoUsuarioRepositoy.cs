using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using Senai_SpMedicalGroup.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class TipoUsuarioRepositoy : ITipoUsuarioRepository
    {
        MedicalGroupContext ctx = new MedicalGroupContext();

        public void AtualizarUrl(int idTipoUsuario, TipoUsuario tipoUsuarioAtualizado)
        {
            TipoUsuario tipoUsuarioBuscado = ctx.TipoUsuarios.Find(idTipoUsuario);
            if (tipoUsuarioBuscado != null)
            {
                tipoUsuarioBuscado.TituloTipoUsuario = tipoUsuarioAtualizado.TituloTipoUsuario;


                ctx.Update(tipoUsuarioBuscado);

                ctx.SaveChanges();
            }
        }

        public TipoUsuario BuscarPorId(int idTipoUsuario)
        {
                return ctx.TipoUsuarios
                    .Select(t => new TipoUsuario()
                    {
                        IdTipoUsuario = t.IdTipoUsuario,
                        TituloTipoUsuario = t.TituloTipoUsuario
                    })
                    .FirstOrDefault(t => t.IdTipoUsuario == idTipoUsuario);
        }  
       
        
        public void Cadastrar(int idTipoUsuario, TipoUsuario novoTipoUsuario)
        {
            ctx.TipoUsuarios.Add(novoTipoUsuario);

            ctx.SaveChanges();
        }

        public void Deletar(int idTipoUsuario)
        {
        ctx.TipoUsuarios.Remove(BuscarPorId(idTipoUsuario));

        ctx.SaveChanges();
    }

        public List<TipoUsuario> ListarTodos()
        {
            return ctx.TipoUsuarios.ToList();
        }
    }
}
