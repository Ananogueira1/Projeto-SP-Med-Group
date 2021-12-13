import api from '../services/api';
import React, { Component } from 'react';
import {
    StyleSheet, ImageBackground, View, Image, TextInput, TouchableOpacity, Text
} from 'react-native';

export default class Projetos extends Component {
    constructor(props) {
        super(props);
        this.state = {
            Lista: []
        }
    };

    BuscarProjetos = async () => {
        const resposta = await api.get('/Consultas/minhas');

        const dadosApi = resposta.data;
        this.setState({ Lista: dadosApi })
    }

    componentDidMount() {
        this.BuscarProjetos();
    }
}
