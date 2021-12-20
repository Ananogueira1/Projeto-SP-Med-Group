using Microsoft.AspNetCore.Http;
using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using Senai_SpMedicalGroup.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class UsuarioRepositoy : IUsuarioRepository
    {

        MedicalGroupContext ctx = new MedicalGroupContext();
        public void AtualizarUrl(int idUsuario, Usuario UsuarioAtualizado)
        {
            throw new NotImplementedException();
        }

        public Usuario BuscarPorId(int idUsuario)
        {
            return ctx.Usuarios
                .Select(u => new Usuario()
                {
                    IdUsuario = u.IdUsuario,
                    Nome = u.Nome,
                    Email = u.Email,
                    IdTipoUsuarioNavigation = new TipoUsuario()
                    {
                        IdTipoUsuario = u.IdTipoUsuarioNavigation.IdTipoUsuario,
                        TituloTipoUsuario = u.IdTipoUsuarioNavigation.TituloTipoUsuario,
                    },
                    Medicos = u.Medicos,
                    Pacientes = u.Pacientes
                })
                .FirstOrDefault(u => u.IdUsuario == idUsuario);
        }

        public Usuario BuscarPorIdelete(int idUsuario)
        {
            return ctx.Usuarios               
                .FirstOrDefault(u => u.IdUsuario == idUsuario);
        }

        public void Cadastrar(Usuario novoUsuario)
        {
            ctx.Usuarios.Add(novoUsuario);

            ctx.SaveChanges();
        }

        public string ConsultarFotoDir(int idUsuario)
        {
            string nomeArquivo = idUsuario.ToString() + ".png";

            string caminho = Path.Combine("perfil", nomeArquivo);

            if (File.Exists(caminho))
            {
                byte[] bytesArquivo = File.ReadAllBytes(caminho);

                return Convert.ToBase64String(bytesArquivo);
            }
            return null;
        }

        public void Deletar(int idUsuario)
        {
            Usuario usuarioBuscado = BuscarPorIdelete(idUsuario);

            ctx.Usuarios.Remove(usuarioBuscado);

            ctx.SaveChanges();
        }

        public List<Usuario> ListarTodos()
        {
             return ctx.Usuarios
                .Select(u => new Usuario()
                {
                    IdUsuario = u.IdUsuario,
                    Nome = u.Nome,
                    Email = u.Email,
                    IdTipoUsuarioNavigation = new TipoUsuario()
                    {
                        IdTipoUsuario = u.IdTipoUsuarioNavigation.IdTipoUsuario,
                        TituloTipoUsuario = u.IdTipoUsuarioNavigation.TituloTipoUsuario,
                    },
                    Medicos = u.Medicos,
                    Pacientes = u.Pacientes
                })
                .ToList();
        }

        public Usuario Login(string email, string senha)
        {
            return ctx.Usuarios.FirstOrDefault(u => u.Email == email && u.Senha == senha);
        }

        public void SalvarPerfilDir(IFormFile foto, int idUsuario)
        {
            string nomeArquivo = idUsuario.ToString() + ".png";

            if (!Directory.Exists("perfil"))
            {
                Directory.CreateDirectory("perfil");
            }

            using (var stream = new FileStream(Path.Combine("perfil", nomeArquivo), FileMode.Create))
            {
                foto.CopyTo(stream);
            }
        }
    }
}
