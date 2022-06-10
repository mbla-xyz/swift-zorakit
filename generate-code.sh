#!/usr/bin/env bash
swift-graphql https://api.zora.co/graphql --config swiftgraphql.yml --output Sources/ZoraAPI/Schema.swift
