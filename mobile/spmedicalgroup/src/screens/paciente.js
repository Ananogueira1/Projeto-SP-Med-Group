
import api from '../services/api';
import React, { Component } from 'react';
import {
    StyleSheet, ImageBackground, View, Image, TextInput, TouchableOpacity, Text, FlatList,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

export default class Projetos extends Component {
    constructor(props) {
        super(props);
        this.state = {
            Lista: []
        }
    };

    BuscarConsulta = async () => {
        try {
            const Token = await AsyncStorage.getItem('userToken')
            const resposta = await api.get('/Pacientes'
                , {
                    headers: {
                        'Authorization': 'Bearer '+Token
                    }
                });

            if (resposta.status == 200) {
                const dadosApi = resposta.data;
                this.setState({ Lista: dadosApi})
                console.warn(this.state.Lista);
            }
        } catch (error) {
            console.warn(error)
        }
    }

    componentDidMount() {
        this.BuscarConsulta();
    }

    render() {
        return (
            <ImageBackground
            source={require('../../assets/azulzinho.png')}
            style={StyleSheet.absoluteFillObject}>
    

                <View style={styles.main}>
                    <View style={styles.Meu_titulo}>

                    <Text style={styles.consultas}>LISTAR MINHAS CONSULTAS</Text>
                    </View>

                    <FlatList
                    contentContainerStyle={styles.lista}
                    data={this.state.Lista}
                    keyExtractor={item => item.IdConsulta}
                    renderItem={this.renderItem}
                />
                </View>

                

            </ImageBackground>

        );
    }

    renderItem = ({ item }) => (
        <View style={styles.container_lista}>
            <View style={styles.container_nomes}>
               {/* <Text style={styles.nomeMedico}>{(item.idMedicoNavigation.nomeMedico)}</Text>*/}
                <Text style={styles.nomePaciente}>{(item.idPacienteNavigation.nomePaciente)}</Text>
                <Text style={styles.descricao}>{(item.idSituacaoNavigation.situacao1)}</Text>
                <Text style={styles.dataConsulta}>{item.dataConsulta}</Text>
            </View>
            <Text style={styles.descricao}>
                {item.Descricao}
            </Text>
        </View>
    )

}


const styles = StyleSheet.create({

    container_nomes : {
        flex : 1
    },

    nada : {
        flex : 1
    },

    main: {
        justifyContent: 'center',
        alignItems: 'center',
        width: '100%',
        height: '100%',
    },

    consultas: {
        widthi: '45%',
        color: '#000',
        fontSize: 30,
        
    },

    Meu_titulo: {
       justifyContent: 'space-between',
        alignItems: 'center',
        marginTop: '25%',
        marginBottom: '97%',
        height: '5%',
        width: '100%',
    },

    container_lista: {
         height: 150,
        flex : 4,
        backgroundColor: '#f1f1f1',
       // borderRadius: 10,
        paddingLeft: 7,
        width: 230,
        marginTop: 100,
    },

    NomeMedico: {
        fontSize: 20,
        fontFamily: 'Roboto',
        color: '#000',
        fontWeight: '400',
    },

    NomePaciente: {
        fontSize: 20,
        fontFamily: 'Roboto',
        color: '#000',
        fontWeight: '400',
    },

    Situacao: {
        fontSize: 20,
        fontFamily: 'Roboto',
        color: '#000',
        fontWeight: '400',
    },

    dataConsulta: {
        fontSize: 20,
        fontFamily: 'Roboto',
        color: '#000',
        fontWeight: '400',
    }
})
