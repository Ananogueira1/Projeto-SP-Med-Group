import React, { Component } from 'react';
import {
  Image,
  ImageBackground,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

import api from '../services/api';
import jwtDecode from 'jwt-decode';

export default class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: 'henrique@gmail.com',
      senha: 'henrique423',
    }
  }

  realizarLogin = async () => {
    console.warn(this.state.email + ' ' + this.state.senha);

    try {

      const resposta = await api.post('/Login', {
        email: this.state.email,
        senha: this.state.senha,
      });

      console.warn(resposta);
      const token = resposta.data.token;

      console.warn(token);

      await AsyncStorage.setItem('userToken', token);
      console.warn(resposta.data);

      if (resposta.status == 200) {

        console.warn('Login Realizado')
        console.warn(jwtDecode(token).role)

        var certo = jwtDecode(token).role
        console.warn('certo Ana Nogu' + certo)

        switch (certo) {

          
          case '1':
            this.props.navigation.navigate('Admin');
            break;
          case '2':
            console.warn('aqui');
            this.props.navigation.navigate('Medico');
            break;
          case '3':
            this.props.navigation.navigate('ConsultaPaciente');
            break;

          default:
            break;
        }

      }

    } catch (error) {
      console.warn(error)
    }
  };


  render() {
    return (
      <ImageBackground

        source={require('../../assets/azulzinho.png')}
        style={StyleSheet.absoluteFillObject}>

        <View style={styles.overlay} />
        <View style={styles.main}>
          <Image
            source={require('../../assets/logo.png')}
            style={styles.mainImgLogin}
          />
          <View style={styles.box}>



            <TextInput
              style={styles.inputLogin}
              placeholder="Email"
              placeholderTextColor="#000"
              keyboardType='email-address'
              onChangeText={email => this.setState({ email })}
            />

            <TextInput
              style={styles.inputLogin}
              placeholder="Senha"
              placeholderTextColor="#000"
              secureTextEntry={true}

              onChangeText={senha => this.setState({ senha })}
            />

            <TouchableOpacity
              style={styles.btnLogin}
              onPress={this.realizarLogin}>
              <Text style={styles.btnLoginText}>Login</Text>
            </TouchableOpacity>

          </View>
        </View>
      </ImageBackground>
    );
  }
};

const styles = StyleSheet.create({

  overlay: {
    ...StyleSheet.absoluteFillObject

  },


  main: {
    justifyContent: 'center',
    alignItems: 'center',
    width: '100%',
    height: '90%',
  },

  mainImgLogin: {
    height: 110,
    width: 297,
    margin: 40,
    marginTop: 0,
    marginEnd: 0.1,
  },

  box: {
    backgroundColor: '#ffff',
    width: 300,
    height: 300,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 20,
  },

  inputLogin: {
    width: 260, //largura mesma do botao
    marginBottom: 35, //espacamento pra baixo
    // marginVertical: 20,
    fontSize: 17,
    borderBottomColor: '#000', //linha separadora
    borderBottomWidth: 1, //espessura.
  },

  btnLogin: {
    backgroundColor: '#3A88A1',
    border: 2,
    height: 37,
    width: 174,
  },

  btnLoginText: {
    fontWeight: 'bold',
    fontSize: 22, //aumentar um pouco
    fontFamily: 'Roboto', //troca de fonte
    color: '#FFF', //mesma cor identidade
    justifyContent: 'center',
    alignItems: 'center',
    marginLeft: 55,
  },

});