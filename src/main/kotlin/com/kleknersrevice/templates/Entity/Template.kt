package com.kleknersrevice.templates.Entity

import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import javax.persistence.*

@Entity
@Table(name = "Template")
class Template(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long,
    @Enumerated(EnumType.STRING)
    var colorScheme: ColorScheme? = null,
    @Column(name = "name")
    var name: String,
    @Column(name = "Lower_Color_Bound")
    var lowerColorBound: Int,
    @Column(name = "Points")
    var points: Int,
    @Column(name = "Min_Radius")
    var minRadius: String,
    @Column(name = "Triangles")
    var triangles: Int,
    @Column(name = "Max_Radius")
    var maxRadius: String,
    @Column(name = "Max_Circularity")
    var maxCircularity: String,
    @Column(name = "Circularity")
    var circularity: Double,
    @Column(name = "Radius")
    var radius: Double,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Device_ID", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    var device: Device,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Film_ID", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    var film: Film,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Luminophore_ID", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    var luminophore: Luminophore
)

class TemplateContext(var device: Device, var film: Film, var luminophore: Luminophore)
